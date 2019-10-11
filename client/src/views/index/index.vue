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
import { Component, Watch, Vue } from 'vue-property-decorator';
import {mixins} from 'vue-class-component';
import Route from 'vue-router';
import {getIndexMovies} from '@/apis/home';
import TitleBar from '@/components/TitleBar.vue';
import MovieList from '@/components/MovieList.vue';
import setTitleAndMetaMixin from '@/mixins/setTitle';

@Component({
  name: 'home',
  components: {
    TitleBar,
    MovieList
  },
})
export default class extends mixins (setTitleAndMetaMixin) {
    private indexMoviesFun = getIndexMovies;
  
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