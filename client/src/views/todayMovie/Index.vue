<template>
    <div class="today-m-wp min-width">
        <div class="section">
            <title-bar :isShowMore="false" :title="$t('todayMovie.todayMovieIntroduce')" url="/movie/more"></title-bar>
            <!-- 今日热门电影 -->
            <movie-list :handleMovieFun="todayMovieFun"></movie-list>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import { getTodayMovies } from '@/apis/todayMovie';
import TitleBar from '@/components/TitleBar.vue';
import MovieList from '@/components/MovieList.vue';

@Component({
    name: 'todayMovie',
    components: {
        TitleBar,
        MovieList
    }
})
export default class extends Vue{
    private todayMovieFun = getTodayMovies;
}
</script>

<style lang="scss" scoped>
</style>