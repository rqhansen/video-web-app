<template>
    <div class="m-list">
        <dl>
            <dt><span>{{$t('header.hotMovie')}}：</span></dt>
            <dd>
                <span v-for="(movie,idx) of movies" 
                        :key="idx" 
                        class="transition" 
                        :class="{'new': idx <2}"
                        @click="goMovieDetail(movie.url)">
                    {{movie.title}}
                </span>
            </dd>
        </dl>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator'
    import {HotMovie} from '@/interface/hotMovie';

    @Component({
        name: 'HotMovie', 
    })
    export default class extends Vue {
        private movies: HotMovie[] = []

        created() {
            this.getMovieList();
        }

        private getMovieList() {
            this.movies = [
               {
                    title: '囧妈',
                    url:'/comedy/3906'
                },
                {
                    title: '叶问4：完结篇',
                    url:'/action/4689'
                },
                {
                    title: '只有芸知道',
                    url:'/romance/2004'
                },
                {
                    title: '肥龙过江',
                    url:'/comedy/3908'
                },
                {
                    title: '决战中途岛',
                    url: '/war/401'
                }
            ]
        }

        //去电影详情页
        private goMovieDetail(url: string) {
            const {path} = this.$route;
            if(path === url) return;
            this.$router.push(`${url}`);
        }  
    }
</script>

<style lang="scss" scoped>
    .m-list {
        width: 100%;
        height: 30px;
        line-height: 30px;
        font-size: 13px;
        overflow: hidden;
        dt {
            float: left;
        }
        dd {
            float: left;
            color: $font-blue-color;
            span {
                margin: 0 2px;
                cursor: pointer;
                &:not(.new):hover {
                    @include font_color($font-theme1-color);
                }
                &.new {
                    @include font_color($font-theme1-color);
                }
            } 
        }
    }
</style>