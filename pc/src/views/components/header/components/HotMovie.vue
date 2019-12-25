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
                    title: '古田军号',
                    url:'/drama/6229'
                },
                {
                    title: '我和我的祖国',
                    url:'/drama/6221'
                },
                {
                    title: '宝莱坞双雄之战',
                    url:'/action/4677'
                },
                {
                    title: '法外之徒',
                    url:'/action/4678'
                },
                {
                    title: '狱中龙',
                    url:'/action/4645'
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