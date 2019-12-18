<template>
    <section class="week-movie-box">
        <main class="scroll-wrap">
            <mt-loadmore :top-method="refresh" ref="loadmore"> 
                <div v-for="(movie,idx) of movies" :key="idx">
                    <div class="m-title-bar">
                        <title-bar :title="`最新${movie[0].typeName}`">
                            <router-link class="more" :to="`/movie/${movie[0].filmType}`">更多</router-link>
                        </title-bar>
                    </div>
                    <div class="movies-wp">
                        <ul class="m-pic-list">
                            <li v-for="m of movie" :key="`${m.typeId}`+m.id">
                                <movie-item :movie="m"/>
                            </li>
                        </ul>
                    </div>
                </div>
                <Footer/>
            </mt-loadmore>
        </main>
        <!-- 回顶部 -->
        <back-top target=".scroll-wrap"/>
    </section>
</template>

<script>
import { getWeekMovies } from '@/apis/weekMovie';
import MovieItem from '@/views/common/movieItem';
export default {
    name: 'WeekMovie',
    components: { MovieItem },
    data() {
        return {
            movies: []
        }
    },
    methods: {
        async getWeekMovies(params={}) {
            const {data: { code,data: { typeMovie} } } = await getWeekMovies(params);
            this.movies = typeMovie;
        },
        async refresh() {
            await this.getWeekMovies({loading: false});
            this.$refs.loadmore.onTopLoaded();
        }
    },
    created() {
        this.getWeekMovies();
    }
}
</script>

<style lang="scss" scoped>
.week-movie-box {
    /deep/ .mint-loadmore-top {
        height: 80px!important;
        line-height: 106px!important;
        margin-top: -66px!important;
    }
    .m-title-bar{
        height: 80px;
        .more {
            font-size: 24px;
            font-weight: bold;
        }
    }
    .movies-wp {
        padding: 16px 8px 0;
        .m-pic-list {
            width: 100%;
            @include flex(flex-start);
            flex-wrap: wrap;
            > li {
                flex: 1;
                max-width: 367px;
                padding: 0 8px 20px;
            }
        }
    }
}
</style>