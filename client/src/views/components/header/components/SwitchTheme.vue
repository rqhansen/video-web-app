<template>
    <div class="switch-theme-wp">
        <div class="menu-wp" @click.stop="openSwitchTheme">
            <span class="txt transition">{{$t('header.switchTheme')}}</span>
            <i class="el-icon-arrow-down el-icon--right"></i>
        </div>
        <ele-dialog
            :title="$t('switchTheme.switchTheme')"
            :showDialog="centerDialogVisible"
            :width="445"
            customClass="swith-theme-dialog"
            :cancelTxt="$t('switchTheme.cancelBtn')"
            :okTxt="$t('switchTheme.okBtn')"
            :center="true"
            @cancel-dialog="cancelChoiceTheme"
            @handle-dialog="switchTheme"
            >
            <div class="theme-content-wp">
                <ul>
                    <li v-for="i of 5" :key="i" class="transition" :class="{'active': currThemeIndex==i}" @click.stop="choiceTheme(i)"></li>
                </ul>
            </div>
        </ele-dialog>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    import EleDialog from '@/components/baseComponents/EleDialog.vue';
    import request from '@/utils/request';
    @Component({
        name: 'SwitchTheme',
        components: {
            EleDialog
        }
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
                message: window.vm.$t('messages.switchThemeSuccess'),
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
            position: relative;
            border: 2px solid transparent;
            border-radius: 10px;
            box-shadow: 0 3px 5px 1px #999;
            cursor: pointer;
            &:not(:last-child) {
                margin-bottom: 15px;
            }
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
    /deep/.swith-theme-dialog {
        .el-dialog__footer {
            .el-button {
                width: 95px;
            }
        }
    }   
}
</style>