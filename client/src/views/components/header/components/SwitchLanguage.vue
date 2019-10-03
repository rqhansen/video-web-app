<template>
    <div class="switch-language-wp">
        <div class="switch-language">
            <el-dropdown @command="switchLanguage">
                    <span class="el-dropdown-link tansition">
                        {{$t('header.switchLanguage')}}<i class="el-icon-arrow-down el-icon--right"></i>
                    </span>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item command="zh" :disabled="$i18n.locale==='zh'">中文</el-dropdown-item>
                        <el-dropdown-item command="en" :disabled="$i18n.locale=== 'en'">English</el-dropdown-item>
                    </el-dropdown-menu>
            </el-dropdown>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component, Vue} from 'vue-property-decorator';
    import { getLanguage ,setLanguage } from '@/utils/localStorages'
    @Component({
        name: 'SwitchLanguage'
    })
    export default class extends Vue {
        //切换语言
        private switchLanguage(languageType: string) {
            this.$i18n.locale = languageType;
            const language = getLanguage();
            if (!language) {
                setLanguage(languageType);
                return;
            } 
            if (language !== languageType) {
                setLanguage(languageType);
            }
        }
    }
</script>

<style lang="scss" scoped>
    .switch-language-wp {
        .switch-language {
            .el-dropdown  {
                font-size: 13px;   
                line-height: 30px;
            }   
        }
    }
</style>