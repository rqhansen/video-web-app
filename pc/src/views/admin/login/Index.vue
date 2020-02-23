<template>
    <div class="ad-login-wp">
        <div class="login-container">
            <div class="form-wp">
                <h1>登录后台</h1>
                <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                    <el-form-item label="用户名" prop="userName">
                        <el-input v-model="ruleForm.userName" @keyup.enter.native="submitForm('ruleForm')"></el-input>
                    </el-form-item>
                    <el-form-item label="密码" prop="password">
                        <el-input :show-password="true" v-model="ruleForm.password" type="password" @keyup.enter.native="submitForm('ruleForm')"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" :loading="loading" @click="submitForm('ruleForm')">登录</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
    </div>
</template>

<script>
import crypto from 'crypto';
import request from '@/utils/request';
export default {
    name: 'adminLogin',
    data() {
        return {
            loading: false,
            ruleForm: {
                userName: '',
                password: '',
            },
            rules: {
                userName: [
                    {required: true,message: '请输入用户名',trigger: 'blur'},
                    {min: 6,max: 10,message: '用户名在6到10之间',trigger: 'blur'}
                ],
                password: [
                    {required: true,message: '请输入密码',trigger: 'blur'}
                ]
            }
        }
    },
    methods: {
        submitForm(formName) {
            this.loading = true;
            this.$refs[formName].validate((valid) => {
                if(!valid) {
                    this.loading = false;
                    return;
                }
                this.login();
            })
        },
        async login() {
            const localToken = localStorage.getItem('token');
            if(localToken) {
                this.$router.push('/admin-index');
                return;
            }
            const pwd = this.encryptePwd();
            const params = {userName: this.ruleForm.userName,password: pwd};
            const { data: { code,data: { token }} } = await request({url: '/api/adminLogin',method: 'post',data:params});
            this.loading = false;
            if(code != 0) {
                this.$set(this.ruleForm,'password','');
                return;
            } 
            Object.keys(this.ruleForm).forEach(key => this.ruleForm[key] = null);
            localStorage.setItem('token',token);
            this.$router.push('/admin-index');
        },
        // 加密密码
        encryptePwd() {
            const password = this.ruleForm.password;
            let md5 = crypto.createHash('md5');
            md5.update(password);
            const pwd = md5.digest('hex');
            return pwd;
        }
    }
}
</script>
<style lang="scss" scoped>
    .ad-login-wp {
        height: 100%;
        background-color: #2d3a4b;
        .login-container {
            width: 100%;
            padding-top: 150px;
        }
        .form-wp {
            width: 520px;
            padding: 0 35px;
            margin: 0 auto;
            color: #fff;
        }
        h1 {
            margin-bottom: 40px;
            font-size: 28px;
            text-align: center;
            font-weight: normal;
        }
        .el-form-item {
            margin-bottom: 40px;
        }
        /deep/ .el-form-item__label {
            color: #fff;
        }
        /deep/ .el-form-item__content {
            .el-input__inner {
                background: rgba(0,0,0,.1);
                border-color: rgba(255,255,255,.1);
                color: white;
            }
        }
        /deep/ .el-button--primary {
            width: 350px;
        }
    }
</style>