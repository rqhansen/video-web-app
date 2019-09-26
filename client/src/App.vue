<template>
  <div id="app" class="app">
    <!-- 头部 -->
    <Header/>
    <transition name="fade-move">
      <keep-alive>
        <router-view class="main" />
      </keep-alive>
  </transition>
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

  export default class extends Vue {}
</script>

<style lang="scss">
@import '~@styles/index.scss';
.app {
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
  .fade-move-enter-active {
    transition: all .3s ease;
  }
  .fade-move-enter {
    transform: translateX(10px);
    opacity: 0;
  }
  .limit-width {
    min-width: 768px;
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

  .main {
    min-height: 725px;
  }
}
</style>