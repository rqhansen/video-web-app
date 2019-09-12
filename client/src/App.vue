<template>
  <div id="app">
    <!-- 头部 -->
    <Header/>
    <router-view/>
    <!-- 尾部 -->
    <el-button type="primary">jsjaj </el-button>
  </div>
</template>

<script lang="ts">
  import {Component,Vue} from 'vue-property-decorator';
  import {getIndexMovieList} from '@/apis/home.ts';
  import Header from '@/views/components/header/index.vue';

  @Component({
      name: 'App',
      components: {
        Header
      }
  })

  export default class extends Vue {
    async created() {
      const list = await getIndexMovieList();
      console.log(list);
    }
  }
</script>

<style lang="scss">
#app {
  //全局
  .clearfix:after {
    display: block;
    clear: both;
    content: "";
    visibility: hidden;
    height: 0;
  }
  .clearfix {
    zoom: 1;
  }
  .section {
    width: 1000px;
    margin: 0 auto;
  }
  .transition {
    transition: all .3s;
  }
}
</style>