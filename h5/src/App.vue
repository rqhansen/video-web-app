<template>
  <div id="app">
      <!-- 头部 -->
      <Header/>
      <keep-alive>
        <router-view></router-view>
      </keep-alive>

  </div>
</template>

<script>
import Header from '@/views/common/header';
export default {
  name: 'App',
  components: {
    Header
  }
}
</script>

<style lang="scss">
@import '~@styles/index.scss';
#app {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
img {
  content: normal !important;
}

.iconfont {
  font-size: 32px;
}
</style>
