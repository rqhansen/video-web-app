<template>
  <div id="app">
    <!-- 头部 -->
    <Header/>
    <router-view/>
    <!-- 尾部 -->
    <common-footer/>
  </div>
</template>

<script lang="ts">
  import {Component,Vue} from 'vue-property-decorator';
  import Header from '@components/header/Index.vue';
  import CommonFooter from '@components/footer/Index.vue';
  @Component({
      name: 'App',
      components: {
        Header,
        CommonFooter
      }
  })

  export default class extends Vue {
    
  }
</script>

<style lang="scss">
#app {
  .clearfix {
    zoom: 1;
  }
  .clearfix:after {
    display: block;
    clear: both;
    content: "";
    visibility: hidden;
    height: 0;
  }
  .section {
    width: 1000px;
    margin: 0 auto;
  }
  .transition {
    transition: all .3s;
  }
  .ellipsis {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  @Media (max-width:999px) {
    .section  {
      width: 95%;
    }
  }
}
</style>