<template>
    <section class="home">
        <main>
            <div class="title-wp">
                <title-bar>
                    <router-link class="more" to="/more">更多</router-link>
                </title-bar>
            </div>
            <div class="movies-wp">   
                <ul>
                    <li v-for="movie of movies" :key="`${movie.typeId}`+movie.id">
                        <movie-item :movie="movie"/>
                    </li>
                </ul>   
            </div>
        </main>
    </section>
</template>

<script>
import TitleBar from '@/views/common/titleBar';
import MovieItem from '@/views/common/movieItem';
import { getHomeMovies } from '@/apis/home.js';
export default  {
    name: 'Home',
    components: {
        TitleBar,
        MovieItem
    },
    data (){
        return  {
            movies: []
        }
    },
    methods: {
        async getTodayHotMovie() {
            const { data:{ code,data: { movies } } } = await getHomeMovies();
            this.movies = movies;
            console.log(movies);
        }
    },
    created() {
        this.getTodayHotMovie();
    }
}
</script>

<style lang="scss" scoped>
.home {
    height: calc(100% - 90px);
    z-index:1;
    > main {
        height: 100%;
        overflow-y: scroll;
        overflow-x: hidden;
        -webkit-overflow-scrolling: touch;
    }
    .title-wp {
        height: 80px;
        padding: 0 16px;
        background-color: #f7f7f7;
        .more {
            font-size: 24px;
            font-weight: bold;
        }
    }
    .movies-wp {
        padding: 16px 8px 0;
        ul {
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
