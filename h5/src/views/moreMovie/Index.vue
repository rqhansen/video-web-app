<template>
    <section class="more-movie-box">
        <main class="scroll-wrap">
            <div class="m-title-bar"> 
                <title-bar />
            </div>
            <div class="movies-wp">
                <mt-loadmore :top-method="refresh" ref="loadmore">  
                    <ul class="m-pic-list">
                        <li v-for="movie of movies" :key="`${movie.typeId}`+movie.id">
                            <movie-item :movie="movie"/>
                        </li>
                    </ul>
                </mt-loadmore>    
            </div>
            <Footer/>
        </main>
        <!-- 回顶部 -->
        <back-top target=".scroll-wrap"/>
    </section>
</template>

<script>
import MovieItem from '@/views/common/movieItem';
import { getMoreMovie } from '@/apis/moreMovie.js';
export default  {
    name: 'Home',
    components: { 
        MovieItem
    },
    data (){
        return  {
            movies: [],
            cancel: ''
        }
    },
    methods: {
        async getMoreMovie(params={}) {
            const { data:{ code,data: { movies } } } = await getMoreMovie(params);
            this.movies = movies;
        },
        async refresh() {
            await this.getMoreMovie({loading: false});
            this.$refs.loadmore.onTopLoaded();
        }
    },
    created() {
        this.getMoreMovie();
    }
}
</script>

<style lang="scss" scoped>
.more-movie-box {
    .m-title-bar{
        height: 80px;
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
