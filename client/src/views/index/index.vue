<template>
  <div class="home">
    <div class="section">
      <!-- 今日热门电影推荐 -->
      <title-bar></title-bar>
      <!-- 今日电影列表 -->
      <movie-list :movies="movies"></movie-list>
    </div>
  </div>
</template>

<script lang="ts">
import {getIndexMovies} from '@/apis/home';
import { Component,Vue } from 'vue-property-decorator';
import TitleBar from '@/components/TitleBar.vue';
import MovieList from '@/components/MovieList.vue';

@Component({
  name: 'home',
  components: {
    TitleBar,
    MovieList
  },
})
export default class extends Vue {
    private movies = [];
    async created() {
        this.getMovieList();
    }

    private async getMovieList() {
        const { data: { code, data: { movies } } } = await getIndexMovies();
        this.movies = movies;
    }
}
</script>

<style lang="scss" scoped>
  .home {
    .m-list-wp{
      width: 100%;
      min-width: 720px;
    }
  }
</style>