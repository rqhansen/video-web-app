<template>
    <div class="header min-width">
        <!-- 热门电影和切换主题 -->
        <div class="header-top-wp">
            <div class="section">
                <div class="lf">
                    <hot-movie/>
                </div>
                <div class="rt">
                    <switch-theme/>
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
                </div>
                <!-- 下载提示 -->
                <div class="down-m-tip">
                    <div class="tip transition" @click.stop="goDownLoad">
                        <span>下载无限制版迅雷</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- logo、搜索结束 -->
        <!-- 导航菜单 -->
        <div class="movie-nav-wp">
            <div class="section">
                <movie-nav/>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    import HotMovie from './components/HotMovie.vue';
    import SwitchTheme from './components/SwitchTheme.vue';
    import Logo from './components/Logo.vue';
    import Search from './components/Search.vue';
    import MovieNav from './components/MovieNav.vue';
    import FastNav from './components/FastNav.vue';
    
    @Component({
        name:'Header',
        components: {
            HotMovie,
            SwitchTheme,
            Logo,
            Search,
            MovieNav,
            FastNav
        }
    })

    export default class extends Vue {

        private goDownLoad() {
            this.$router.push('/download')
        }
    }
</script> 

<style lang="scss" scoped>
    .header {
        .header-top-wp {
            box-shadow: 0 1px 10px 0 #d9d9d9;
            overflow: hidden;
            .lf {
                float: left;
            }
            .rt {
                float: right;
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
                width: 220px;
                height: 66px;
                margin-top: 21px;
                overflow: hidden;
            }
            .search-wp {
                float: right;
                margin-top: 35px;
            }
            .down-m-tip {
                position: absolute;
                bottom: 12px;
                right: 396px;
                .tip {
                    color: $font-blue-color;
                    cursor: pointer;
                    &:hover {
                        color: $font-theme-color;
                    }
                }
            }
        }
        .movie-nav-wp {
            background: $font-theme-color;
        }
    }

    @media (max-width: 767px) {
        .header {
            .logo-search-wp {
                .logo-wp {
                    width: 30%;
                }
                .down-m-tip  {
                    left: 30%;
                    right: initial;
                }
            }
            .search-wp {
                width: 70%;
            }
        }
    }
</style>