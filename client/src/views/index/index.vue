<template>
  <div class="home">
    <div class="section">
      <!-- 今日热门电影推荐 -->
      <title-bar :title="$t('todayMovie.todayMovieIntroduce')"></title-bar>
      <!-- 今日电影列表 -->
      <movie-list :handleMovieFun="indexMoviesFun"></movie-list>
    </div>
  </div>
</template>

<script lang="ts">
import { Component,Vue } from 'vue-property-decorator';
import {getIndexMovies} from '@/apis/home';
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

    beforeRouteEnter () {
      document.title = '万寻资源网_万寻迅雷电影下载网_最新电影_高清电影_迅雷免费电影下载';
    }
}
</script>

<style lang="scss" scoped>
  .home {
    /deep/ .movie-list {
      ul {
        min-height: 685px;
      }
    }
  }
</style>