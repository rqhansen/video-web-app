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

import { Component, Watch, Vue } from 'vue-property-decorator';

@Component({
    name: 'MovieNav',
    computed:{
        menus() {
            return [
                {
                    title: this.$t('nav.home'),
                    url: '/'
                },
                {
                    title: this.$t('nav.action'),
                    url: '/movie/action'
                },
                {
                    title: this.$t('nav.comedy'),
                    url: '/movie/comedy'
                },
                {
                    title: this.$t('nav.romance'),
                    url: '/movie/romance'
                },
                {
                    title: this.$t('nav.science'),
                    url: '/movie/science'
                },
                {
                    title: this.$t('nav.drama'),
                    url: '/movie/drama'
                },
                {
                    title: this.$t('nav.suspense'),
                    url: '/movie/suspense'
                },
                {
                    title: this.$t('nav.war'),
                    url: '/movie/war'
                },
                {
                    title: this.$t('nav.thrill'),
                    url: '/movie/thrill'
                },
                {
                    title: this.$t('nav.horror'),
                    url: '/movie/horror'
                },
                {
                    title: this.$t('nav.disaster'),
                    url: '/movie/disaster'
                },
                {
                    title: this.$t('nav.cartoon'),
                    url: '/movie/cartoon'
                }
    ]
        }
    }
})
export default class extends Vue{
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
            padding: 0 6px;
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