<template>
    <section class="drop-menu-wp" :class="{'block':showMenu}">
        <!-- 搜索 -->
        <section class="search-bar">
            <input class="transition" placeholder="输入电影名称搜索..." type="text" v-model="movieName"/>
            <button class="transition">影视搜索</button>
        </section>
        <!-- 搜索结束 -->
        <section class="m-menu">
            <menu-item :title="classifyMoive.title" :menuList="classifyMoive.menus"/>
            <menu-item :title="hotMovie.title" :menuList="hotMovie.menus"/>
            <menu-item class="last-movie" :title="lastMovie.title" :menuList="lastMovie.menus"/>
        </section>
        <!-- 电影分类结束 -->
        <!--  -->
    </section>
</template>

<script>
import { classifyMoive, lastMovie, hotMovie } from '../const';
import menuItem from './menuItem';
export default {
    name: 'DropMenu',
    props: {
        showMenu: {
            required: true,
            default: false
        }
    },
    components: {menuItem},
    watch: {
        showMenu(nVal) {
            if(!nVal) {
                this.movieName && (this.movieName = null);
            }
        }
    },
    data() {
        return {
            movieName: null,
            classifyMoive: classifyMoive,
            hotMovie: hotMovie,
            lastMovie: lastMovie
        }
    },
    created() {
        console.log(classifyMoive);
    }
}
</script>

<style lang="scss" scoped>
.drop-menu-wp {
    position: absolute;
    left: 0;
    top: 90px;
    width: 100%;
    padding: 0 16px;
    height: 0;
    background:rgba(0, 0, 0, .8);
    box-shadow: 1px 2px 5px #888;
    transition: all .3s;
    overflow: hidden;
    &.block {
        height: 730px;
        padding-top: 16px;
        .search-bar {
            display: flex;
            align-items: center;
        }
    }
    .search-bar {
        width: 100%;
        display: flex;
        align-items: center;
    }
    input {
        flex: 1;
        display: block;
        height: 76px;
        padding: 8px 20px;
        color: #666;
        font-size: 28px;
        background-color: #f7f7f7;
        border-radius: 0;
    }
    button {
        display: block;
        width: 224px;
        height: 76px;
        color: #fff;
        font-size: 32px;
        text-align: center;
        background-color: #4da6ff;
        &:active {
            background:rgba(77,166,255,.9);
        }
    }
    .m-menu {
        padding-top: 10px;
    }
}
</style>