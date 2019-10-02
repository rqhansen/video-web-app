<template>
    <div class="week-m-wp min-width">
        <div class="section">
            <div
                v-for="(m,idx) of movies" :key="idx">
                <title-bar :title="`${$t('weekMovie.lastNew')}${m[0].typeName}`" :url="`/movie/${m[0].filmType}`" />
                <movie-list :fetchMovie="m"></movie-list>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import { getWeekMovies } from '@/apis/weekMovie';
import TitleBar from '@/components/TitleBar.vue';
import MovieList from '@/components/MovieList.vue';

@Component({
    name: 'weekMovie',
    components: {
        TitleBar,
        MovieList
    }
})

export default class extends Vue {
    private movies = [];

    async created() {
        this.getMovieList();
    }

    private async getMovieList() {
        const { data: { code, data: { typeMovie } } } = await getWeekMovies();
        this.movies = typeMovie;
    }
}
</script>