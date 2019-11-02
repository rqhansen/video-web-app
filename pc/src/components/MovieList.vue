<template>
    <div class="movie-list">
        <ul v-if="currentMovie.length">
            <li v-for="(m,idx) of currentMovie" :key="idx" @click.stop="goMovieDetail(m.filmType,m.id)">
                <movie-item :movie="m"/>
            </li>
        </ul>
        <empty-data v-else-if="currentMovie && !currentMovie.length"/>
    </div>
</template>

<script lang="ts">
import {Component,Prop,Vue} from 'vue-property-decorator';
import MovieItem from './MovieItem.vue';
import EmptyData from './EmptyData.vue';


@Component({
    name: 'movieList',
    components: {
        EmptyData,
        MovieItem
    }
})

export default class extends Vue {
    
    @Prop({
        default: () => {
            return () => {}
        }
    }) private handleMovieFun!: Function

    @Prop({
        default: () => []
    }) private fetchMovie!: () => []

    get currentMovie() {
        return this.fetchMovie.length ? this.fetchMovie : this.movies
    }

    private movies = '';

    async created() {
        if(!this.fetchMovie.length) { //排除掉
            this.getMovieList();
        }
    }

    private async getMovieList() {
        const { data : { code, data: { movies } } } = await this.handleMovieFun();
        this.movies = movies;
    }

    private goMovieDetail(mType: string, mId: number) {
        this.$router.push(`/${mType}/${mId}`);
    }

}
</script>

<style lang="scss" scoped>
    .movie-list {
        width: 100%;
        padding-top: 10px;
        li {
            display: inline-block;
            width: 16.666667%;
            max-width: 16.666667%;
            padding: 0 20px;
            margin-bottom: 10px;
            font-size: 0;
            text-align: center;
            cursor: pointer;
            overflow: hidden;
        }
    }
    @media (max-width: 992px) {
        .movie-list {
            li {
                width: 25%;
                max-width: 25%;
                padding: 0 15px;
            }
        } 
    }
    
</style>

