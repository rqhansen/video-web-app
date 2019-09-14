<template>
  <div class="home">
    <div class="section">
      <!-- 今日热门电影推荐 -->
      <title-bar></title-bar>
      <!-- 今日电影列表 -->
      <div class="m-list-wp">
          <movie-list></movie-list>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
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
  
}
</script>

<style lang="scss" scoped>
  .home {
    min-width: 768px;
    .m-list-wp{
      margin-top: 20px;
    }
  }
</style>