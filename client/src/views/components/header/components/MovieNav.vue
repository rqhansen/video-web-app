<template>
    <div class="movie-nav clearfix">
        <ul>
            <li v-for="m of menus" 
                :key="m.title" 
                class="transition" 
                :class="{'active': m.url === currMovieType}"
                @click.stop="goClassifyMovie(m.url)"
            >{{m.title}}</li>
        </ul>
    </div>
</template>

<script lang="ts">
const navMenus = [
        {
            title: '首页',
            url: '/'
        },
        {
            title: '动作片',
            url: '/movie/action'
        },
        {
            title: '喜剧片',
            url: '/movie/comedy'
        },
        {
            title: '爱情片',
            url: '/movie/romance'
        },
        {
            title: '科幻片',
            url: '/movie/science'
        },
        {
            title: '剧情片',
            url: '/movie/drama'
        },
        {
            title: '悬疑片',
            url: '/movie/suspense'
        },
        {
            title: '战争片',
            url: '/movie/war'
        },
        {
            title: '惊悚片',
            url: '/movie/thrill'
        },
        {
            title: '恐怖片',
            url: '/movie/horror'
        },
        {
            title: '灾难片',
            url: '/movie/disaster'
        },
        {
            title: '动画片',
            url: '/movie/cartoon'
        }
    ]

import { Component, Vue } from 'vue-property-decorator';

@Component({
    name: 'MovieNav',
})
export default class extends Vue{
    private menus = navMenus;

    get currMovieType() {
        const { name, path, params, params: { id } } = this.$route;
        if(name === 'home') return '/';
        if(name === 'classifyMovie') {
            return `/movie/${id}`;
        }
        if(name === 'movieDetail') {
            return `/movie/${params.movie_type}`;
        }
    }

    private goClassifyMovie(url: string) {
        const { path } = this.$route;
        if(path === url)  return;
        this.$router.push(url);
    }
}
</script>

<style lang="scss" scoped>
    .movie-nav {
        width: 100%;
        li {
            float: left;
            height: 40px;
            line-height: 40px;
            padding: 0 7px;
            color:#fff;
            cursor: pointer;
            &.active {
                color: $font-red-color;
            }
            &:hover {
                color: $font-red-color;
            }
        }
    }
</style>