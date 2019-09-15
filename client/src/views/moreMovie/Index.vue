<template>
    <div class="more-movie-wp">
        <div class="section">
            <title-bar :isShowMore="false"/>
            <movie-list :movies="movies"/>
        </div>
    </div>
</template>

<script lang="ts">
import { Component,Vue } from 'vue-property-decorator';
import { getMoreMovie } from '@/apis/moreMovie';
import TitleBar from '@/components/TitleBar.vue';
import MovieList from '@/components/MovieList.vue';

@Component({
    name: 'moreMovie',
    components: {
        TitleBar,
        MovieList
    }
})


export default class extends Vue{
    private movies = [];

    async created() {
        this.getMoreMovie();
    }

    private async getMoreMovie() {
        const { data: { code, data: { movies } } } = await getMoreMovie();
        this.movies = movies;
    }
}
</script>

<style lang="scss" scoped>

</style>