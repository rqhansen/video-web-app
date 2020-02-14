<template>
    <div class="header min-width">
        <!-- 热门电影和切换主题 -->
        <div class="header-top-wp">
            <div class="section">
                <div class="lf">
                    <hot-movie/>
                </div>
                <div class="rt">
                    <div class="language">
                        <switch-language/>
                    </div>
                    <div class="theme">
                        <switch-theme/>
                    </div>
                </div>
            </div>
        </div>
        <!-- 热门电影结束 -->
        <!-- logo、搜索 -->
        <div class="logo-search-wp">
            <div class="section">
                <!-- 快捷导航 -->
                <div class="fast-nav-wp">
                    <fast-nav/>
                </div>
                <div class="logo-wp">
                    <logo/>
                </div>
                <div class="search-wp">
                    <search/>
                     <!-- 下载提示 -->
                    <div class="down-m-tip">
                        <div class="tip transition" @click.stop="goDownLoad">
                            <span>{{$t('header.downLoadUnlimitThunder')}}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- logo、搜索结束 -->
        <!-- 导航菜单 -->
        <div class="movie-nav-wp">
            <div class="nav-box" :class="{'sticky': isSticky}">
                <div class="section">
                    <movie-nav/>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    import HotMovie from './components/HotMovie.vue';
    import SwitchLanguage from './components/SwitchLanguage.vue';
    import SwitchTheme from './components/SwitchTheme.vue';
    import Logo from './components/Logo.vue';
    import Search from './components/Search.vue';
    import MovieNav from './components/MovieNav.vue';
    import FastNav from './components/FastNav.vue';
    import { ScrollTopModule } from '@/store/modules/scrollTop';
    
    @Component({
        name:'Header',
        components: {
            HotMovie,
            SwitchTheme,
            Logo,
            Search,
            MovieNav,
            FastNav,
            SwitchLanguage
        }
    })

    export default class extends Vue {
            //判断吸顶
        get isSticky() {
            return ScrollTopModule.scrollTop >= 138;
        }
        private goDownLoad() {
            this.$router.push('/downLoadThunder')
        }
    }
</script> 

<style lang="scss" scoped>
    @keyframes sticky-animation {
        from  {
            top: -50px;
        }
        to {
            top: 0;
        }
    }
    .header {
        .header-top-wp {
            box-shadow: 0 1px 10px 0 #d9d9d9;
            overflow: hidden;
            .lf {
                float: left;
            }
            .rt {
                float: right;
                height: 100%;
                .language {
                    display: inline-block;
                    vertical-align: middle;
                    height: 100%;
                    margin-right: 10px;
                }
                .theme {
                    display: inline-block;
                    vertical-align: middle;
                    height: 100%;
                }
            }
        }
        .logo-search-wp {
            .section {
                position: relative;
                height: 108px;
            }
            .fast-nav-wp {
                position: absolute;
                top: 0;
                right: 0;
                line-height: 30px;
            }
            .logo-wp {
                float: left;
                width: 200px;
                height: 66px;
                margin-top: 21px;
                overflow: hidden;
            }
            .search-wp {
                position: relative;
                float: right;
                margin-top: 35px;
            }
            .down-m-tip {
                position: absolute;
                bottom: -25px;
                left: 0;
                .tip {
                    color: $font-blue-color;
                    cursor: pointer;
                    &:hover {
                        @include font_color($font-theme1-color);
                    }
                }
            }
        }
        .movie-nav-wp {
            @include bg_color($font-theme1-color);
            .nav-box {
                &.sticky {
                    position: fixed;
                    top: 0;
                    width: 100%;
                    @include bg_color($font-theme1-color);
                    box-shadow: 0 1px 1px 0 #d9d9d9;
                    animation: sticky-animation .5s ease-in-out;
                    z-index: 2;
                }
            }
        }
    }

    @media (max-width: 767px) {
        .header {
            .logo-search-wp {
                .logo-wp {
                    width: 30%;
                }
            }
            .search-wp {
                width: 70%;
            }
        }
    }
</style>