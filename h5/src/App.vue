<template>
  <div id="app" ref="contentWrap">
      <!-- 头部 -->
      <Header/>
      <keep-alive>
        <router-view class="content routerContent" :key="$route.fullPath"></router-view>
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
  },
  methods: {
    listenScroll() {
      const wp = this.$refs['contentWrap'];
      // const wp = document.getElementById('routerWrap');
      console.log(wp);
      // let scrollTarget = wp[2].firstElementChild;
      // scrollTarget.addEventListener('scroll',(e) => {
      //   this.handleScroll(e);
      // },false);
    },
    handleScroll() {
      const scrollTop = e.target.scrollTop;
      console.log(scrollTop);
      // return document.documentElement.scrollTop || document.body.scrollTop || window.pageYOffset;
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.listenScroll();
    })

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
</style>
