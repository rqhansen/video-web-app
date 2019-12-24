<template>
    <section class="home">
        <main class="scroll-wrap">
            <div class="m-title-bar">
                <title-bar>
                    <router-link class="more" to="/moremovie">更多</router-link>
                </title-bar>
            </div>
            <mt-loadmore :top-method="refresh" ref="loadmore">  
                <div class="movies-wp">
                    <ul class="m-pic-list">
                        <li v-for="movie of movies" :key="`${movie.typeId}`+movie.id">
                            <movie-item :movie="movie"/>
                        </li>
                    </ul>
                </div>
            </mt-loadmore>    
            <Footer/>
        </main>
        <!-- 回顶部 -->
        <back-top target=".scroll-wrap"/>
    </section>
</template>

<script>
import MovieItem from '@/views/common/movieItem';
import { getHomeMovies } from '@/apis/home.js';
export default  {
    name: 'Home',
    components: { MovieItem },
    data (){
        return  {
            movies: [],
            cancel: ''
        }
    },
    methods: {
        async getTodayHotMovie(params) {
            const { data:{ code,data: { movies } } } = await getHomeMovies(params);
            this.movies = movies;
        },
        async refresh() {
            await this.getTodayHotMovie({loading: false});
            this.$refs.loadmore.onTopLoaded();
        }
    },
    created() {
        this.getTodayHotMovie({context: this});
    }
}
</script>

<style lang="scss" scoped>
.home {
    .m-title-bar{
        height: 80px;
        .more {
            font-size: 24px;
            font-weight: bold;
        }
    }
    /deep/ .mint-loadmore-top {
        // margin-top: -55px;
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
