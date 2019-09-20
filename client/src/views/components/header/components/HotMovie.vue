<template>
    <div class="m-list">
        <dl>
            <dt><span>热门电影：</span></dt>
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
                    title: '鼠胆英雄',
                    url:'/comedy/3862'
                },
                {
                    title: '鬼娃回魂',
                    url:'/horror/2670'
                },
                {
                    title: '狱中龙',
                    url:'/action/4645'
                },  
                {
                    title: '昆虫总动员2',
                    url:'/cartoon/14'
                },  
                {
                    title: '银河补习班',
                    url:'/drama/6080'
                },
                {
                    title: '追龙2:贼王',
                    url:'/drama/6079'
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
            color: $font-gray-color;
            span {
                margin: 0 2px;
                cursor: pointer;
                &:not(.new):hover {
                    color: $font-theme-color;
                }
                &.new {
                    color: $font-theme-color;
                }
            } 
        }
    }
</style>