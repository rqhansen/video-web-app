<template>
  <div id="app">
      <!-- 头部 -->
      <Header/>
      <keep-alive>
        <router-view class="content" :key="$route.fullPath"></router-view>
      </keep-alive>
      <!-- 回顶部 -->
      <back-top />
  </div>
</template>

<script>
import Header from '@/views/common/header';
import BackTop from '@/views/common/backTop';
export default {
  name: 'App',
  components: {
    Header,
    BackTop
  }
}
</script>

<style lang="scss">
@import '~@styles/index.scss';
#app {
  width: 100%;
  height: 100%;
  font-size: 26px;
  overflow: hidden;
}
img {
  content: normal !important;
}

.iconfont {
  width: 1em; height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
}
.content {
  height: calc(100% - 90px);
}
.scroll-wrap {
  height: 100%;
  overflow-y: scroll;
  overflow-x: hidden;
  -webkit-overflow-scrolling: touch;
}
</style>
