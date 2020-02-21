<template>
    <div class="ad-index-wp section">
        <div class="ad-index">
            <h1>添加电影</h1>
            <el-form ref="form" :model="form" :rules="rules" label-width="100px">
                <el-form-item label="typeId" prop="typeId" class="type-id-item">
                    <el-select style="width: 590px;" v-model.trim="form.typeId" placeholder="请选择电影类型" @change="getLastImgSrc">
                        <el-option v-for="(item,idx) of movieTypes" :key="idx" :label="Object.keys(item)[0]" :value="Object.values(item)[0]"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="indexImgSrc" prop="indexImgSrc">
                    <el-input v-model.trim="form.indexImgSrc"></el-input>
                </el-form-item>
                <el-form-item label="detailImgSrc" prop="detailImgSrc">
                    <el-input v-model.trim="form.detailImgSrc"></el-input>
                </el-form-item>
                <el-form-item label="typeName" prop="typeName">
                    <el-input v-model.trim="form.typeName"></el-input>
                </el-form-item>
                <el-form-item label="fullName" prop="fullName">
                    <el-input v-model.trim="form.fullName"></el-input>
                </el-form-item>
                <el-form-item label="pureName" prop="pureName">
                    <el-input v-model.trim="form.pureName"></el-input>
                </el-form-item>
                <el-form-item label="pubDate" prop="pubDate">
                    <el-input v-model.trim="form.pubDate"></el-input>
                </el-form-item>
                <el-form-item label="transName">
                    <el-input v-model.trim="form.transName"></el-input>
                </el-form-item>
                <el-form-item label="subPureName">
                    <el-input v-model.trim="form.subPureName"></el-input>
                </el-form-item>
                <el-form-item label="year">
                    <el-input v-model.trim="form.year"></el-input>
                </el-form-item>
                <el-form-item label="country">
                    <el-input v-model.trim="form.country"></el-input>
                </el-form-item>
                <el-form-item label="types">
                    <el-input v-model.trim="form.types"></el-input>
                </el-form-item>
                <el-form-item label="language">
                    <el-input v-model.trim="form.language"></el-input>
                </el-form-item>
                <el-form-item label="caption">
                    <el-input v-model.trim="form.caption"></el-input>
                </el-form-item>
                <el-form-item label="onDate">
                    <el-input v-model.trim="form.onDate"></el-input>
                </el-form-item>
                <el-form-item label="imdbScore">
                    <el-input v-model.trim="form.imdbScore"></el-input>
                </el-form-item>
                <el-form-item label="doubanScore">
                    <el-input v-model.trim="form.doubanScore"></el-input>
                </el-form-item>
                <el-form-item label="imdbLink">
                    <el-input v-model.trim="form.imdbLink"></el-input>
                </el-form-item>
                <el-form-item label="doubanLink">
                    <el-input v-model.trim="form.doubanLink"></el-input>
                </el-form-item>
                <el-form-item label="format">
                    <el-input v-model.trim="form.format"></el-input>
                </el-form-item>
                <el-form-item label="videoSize">
                    <el-input v-model.trim="form.videoSize"></el-input>
                </el-form-item>
                <el-form-item label="fileSize">
                    <el-input v-model.trim="form.fileSize"></el-input>
                </el-form-item>
                <el-form-item label="filmLength">
                    <el-input v-model.trim="form.filmLength"></el-input>
                </el-form-item>
                <el-form-item label="director">
                    <el-input v-model.trim="form.director"></el-input>
                </el-form-item>
                <el-form-item label="editor">
                    <el-input v-model.trim="form.editor"></el-input>
                </el-form-item>
                <el-form-item label="actor">
                    <el-input type="textarea" :autosize="{ minRows: 4, maxRows: 8 }" v-model.trim="form.actor"></el-input>
                </el-form-item>
                <el-form-item label="label">
                    <el-input v-model.trim="form.label"></el-input>
                </el-form-item>
                <el-form-item label="shortIntro">
                    <el-input type="textarea" :autosize="{ minRows: 3, maxRows: 6 }" v-model.trim="form.shortIntro"></el-input>
                </el-form-item>
                <el-form-item label="getAward">
                    <el-input v-model.trim="form.getAward"></el-input>
                </el-form-item>
                <el-form-item label="downUrl" prop="downUrl">
                    <el-input v-model.trim="form.downUrl"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" :loading="loading" @click="submitForm('form')">添加</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
import request from '@/utils/request';
export default {
    data() {
        return {
            loading: false,
            form: {
                typeId: '',
                indexImgSrc: '',
                detailImgSrc: '',
                typeName: '',
                fullName: '',
                pureName: '',
                pubDate: '',
                transName: '',
                subPureName: '',
                year: '',
                country: '',
                types: '',
                language: '',
                caption: '',
                onDate: '',
                imdbScore: '',
                doubanScore: '',
                imdbLink: '',
                doubanLink: '',
                format: 'x264 + aac',
                fileSize: '',
                videoSize: '1920 x 1080',
                filmLength: '',
                director: '',
                editor: '',
                actor: '',
                label: '',
                shortIntro: '',
                getAward: '',
                downUrl: '',
            },
            rules: {
                typeId: [
                    { required: true,message: 'typeId不能为空',trigger: 'blur' },
                    { type: 'number',message: 'typeId必须为数字'}
                ],
                indexImgSrc: [
                    { required: true,message: '图片url不能为空',trigger: 'blur'}
                ],
                detailImgSrc: [
                    { required: true,message: '图片url不能为空',trigger: 'blur'}
                ],
                typeName: [
                    { required: true,message: 'typeName不能为空', trigger: 'blur'}
                ],
                fullName: [
                    { required: true,message: 'fullName不能为空', trigger: 'blur'}
                ],
                pureName: [
                    { required: true,message: 'pureName不能为空', trigger: 'blur'}
                ],
                pubDate: [
                    { required: true,message: 'pubDate不能为空', trigger: 'blur'}
                ],
                downUrl: [
                    { required: true,message: 'downUrl不能为空', trigger: 'blur'}
                ],
            },
            movieTypes: [ //电影类型
                { '动作片': 1 },
                { '喜剧片': 2 },
                { '爱情片': 3 },
                { '科幻片': 4 },
                { '剧情片': 5 },
                { '悬疑片': 6 },
                { '战争片': 7 },
                { '惊悚片': 8 },
                { '恐怖片': 9 },
                { '灾难片': 10 },
                { '动画片': 11 }
            ]
        }
    },
    methods: {
        async getLastImgSrc() {
            const { data: {code,data: {detailImgSrc,indexImgSrc}}} = await request({
                url: '/api/getLastImgSrc',
                method: 'post',
                data: {typeId : this.form.typeId}
            });
            if(code !== 0) return;
            this.$set(this.form,'indexImgSrc',indexImgSrc);
            this.$set(this.form,'detailImgSrc',detailImgSrc);
        },
        submitForm(formName) {
            this.loading = true;
            this.$refs[formName].validate((valid) => {
                if(!valid) {
                    this.loading = false;
                    return;
                }
                this.add();
            })
        },
        async add() {
            const { data: { code,data: {message } } } = await request({
                url: '/api/addMovie',
                method: 'post',
                data: this.form
            });
            this.loading = false;
            if(code !== 0 )return;
            this.$confirm('添加电影成功', '温馨提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                showCancelButton: false,
                customClass: 'confirm-dialog-wp',
                type: 'success'
           }).then(() => {
            Object.keys(this.form).forEach(key => {
                const staticValues = ['typeId','typeName','format','videoSize'];
                if(!staticValues.includes(key)) {
                    this.$set(this.form,key,'');
                }
            })
            this.getLastImgSrc();
            }).catch(() => {})
        }
    }
}
</script>

<style lang="scss" scoped>
.ad-index-wp {
    .ad-index {
        min-width: 680px;
        padding-top: 30px;
        margin: 0 auto;
        h1 {
            margin-bottom: 50px;
            text-align: center;
            font-weight: normal;
            font-size: 28px;
        }
        .el-form-item {
            width: 690px;
            margin: 25px auto;
            .el-button--primary {
                width: 590px;
            }
        }
    }
}
</style>