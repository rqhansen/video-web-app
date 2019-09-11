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
  import Header from '@/components/header/index.vue';

  @Component({
      name: 'App',
      components: {
        Header
      }
  })

  export default class extends Vue {}
</script>

<style lang="less">
#app {
  .transition {
    transition: all .3s;
  }
}
</style>