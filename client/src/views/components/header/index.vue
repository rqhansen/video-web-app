<template>
    <div class="header limit-width">
        <!-- 热门电影 -->
        <div class="hot-m-wp">
            <div class="section">
                <hot-movie/>
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
                    <div class="tip transition">
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
    import Logo from './components/Logo.vue';
    import Search from './components/Search.vue';
    import MovieNav from './components/MovieNav.vue';
    import FastNav from './components/FastNav.vue';
    
    @Component({
        name:'Header',
        components: {
            HotMovie,
            Logo,
            Search,
            MovieNav,
            FastNav
        }
    })

    export default class extends Vue {}
</script> 

<style lang="scss" scoped>
    .header {
        //热门电影
        .hot-m-wp {
            box-shadow: 0 1px 10px 0 #d9d9d9;
            overflow: hidden;
        }
        //logo、快捷导航及搜索区
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
        //导航菜单
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