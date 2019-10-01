<template>
    <div class="switch-theme-wp">
        <div class="switch-language" @click.stop="switchLanguage">
            中文
        </div>
        <div class="menu-wp" @click.stop="openSwitchTheme">
            <span class="txt transition">更换主题</span>
            <i class="el-icon-caret-bottom"></i>
        </div>
        <el-dialog
            title="更换主题"
            :visible.sync="centerDialogVisible"
            width="445px"
            center
            @close="cancelChoiceTheme">
            <div class="theme-content-wp">
                <ul>
                    <li v-for="i of 5" :key="i" class="transition" :class="{'active': currThemeIndex==i}" @click.stop="choiceTheme(i)"></li>
                </ul>
            </div>
            <span slot="footer" class="dialog-footer">
                <el-button @click.stop="cancelChoiceTheme">取 消</el-button>
                <el-button type="primary" @click.stop="switchTheme">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    import request from '@/utils/request';
    @Component({
        name: 'SwitchTheme'
    })

    export default class extends Vue {
        private centerDialogVisible = false;
        private currThemeIndex = '1';

        created() {
            this.currThemeIndex = this.getCurrThemeIndex();
        }

        private closeThemeDialog() {
            this.centerDialogVisible = false;
        }

        private getCurrThemeIndex() {
            return localStorage.getItem('theme-index') || '1';
        }

        private openSwitchTheme() {
            this.centerDialogVisible = true;
        }

        //选择主题
        private choiceTheme(idx: number) {
            this.currThemeIndex =  `${idx}`;
        }

        //切换主题
        private switchTheme() {
            window.document.documentElement.setAttribute('data-theme',`theme${this.currThemeIndex}`);
            this.closeThemeDialog();
            this.$message({
                message: '更换成功',
                center: true,
                showClose: true,
                type: 'success',
                duration: 1500
            });
            const currThemeIndex = this.getCurrThemeIndex();
            if(currThemeIndex === this.currThemeIndex) {
                return;
            }
            localStorage.setItem('theme-index',`${this.currThemeIndex}`);
        }

        //取消选择主题
        private cancelChoiceTheme() {
            this.closeThemeDialog();
            this.currThemeIndex = this.getCurrThemeIndex();
        }

        //切换语言
        private switchLanguage() {
            // this.$i18n.locale = 'en';
            console.log(1);
        }
    }
</script>

<style lang="scss" scoped>
.switch-theme-wp {
    .menu-wp {
        font-size: 13px;
        line-height: 30px;
        cursor: pointer;
        color: $font-blue-color;
        &:hover {
            @include font_color($font-theme1-color);
        }
    }
    .theme-content-wp {
        li {
            width: 395px;
            height: 53px;
            margin-bottom: 15px;
            position: relative;
            border: 2px solid transparent;
            border-radius: 10px;
            box-shadow: 0 3px 5px 1px #999;
            cursor: pointer;
            &.active {
                border-color: #be1204;
            }
        }
        @each $index in 1,2,3,4,5 {
            li:nth-child(#{$index}) {
                background:url('~@imgs/theme/theme-#{$index}.png');
            }
        }
    }
    .el-dialog--center {
        .el-dialog__body {
            padding-top: 5px;
            padding-bottom: 5px;
        }
    }
}
</style>