<template>
  <div class="home">
    <div class="section">
      <!-- 今日热门电影推荐 -->
      <title-bar></title-bar>
      <!-- 今日电影列表 -->
      <movie-list :handleMovieFun="indexMoviesFun"></movie-list>
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
    private indexMoviesFun = getIndexMovies;
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