<template>
  <div id="app" class="app">
    <template v-if="!isAdminPage">
      <!-- 头部 -->
      <Header/>
      <!-- $route.fullPath-->
      <transition name="fade-move">
        <keep-alive>
          <router-view class="main min-width" :key="$route.fullPath"/>
        </keep-alive>
      </transition>
      <!-- 尾部 -->
      <Footer/>
      <!-- 回顶部 -->
      <el-backtop target=".app" :visibilityHeight="400" :bottom="100" :right="80"></el-backtop>
    </template>
    <template v-else>
      <keep-alive>
        <router-view class="min-width"/>
      </keep-alive>
    </template>
  </div>
</template>

<script lang="ts">
  import {Component,Vue} from 'vue-property-decorator';
  import Header from '@components/header/Index.vue';
  import Footer from '@components/footer/Index.vue';
  import {throttle} from '@/utils/throttle';
  import {ScrollTopModule} from '@/store/modules/scrollTop';

  @Component({
      name: 'App',
      components: {
        Header,
        Footer
      }
  })

  export default class extends Vue {
    private container = document.body;
    private throttledScrollHandler: () => void = () => () => {};
    //后台所有的路由
    private adminRouteNames = ['adminLogin','adminIndex'];

    created() {
      this.initCurrTheme();
    }

    get isAdminPage() {
      return this.adminRouteNames.includes(this.$route.name as string);
    }

    mounted() {
      this.init();
      this.throttledScrollHandler = throttle(this.onScroll,100);
      this.container.addEventListener('scroll',this.throttledScrollHandler,false);
    }

    private onScroll() {
      let scrollTop = this.container.scrollTop;
      ScrollTopModule.changeScrollTop(scrollTop);
    }

    private init() {
      this.container = document.getElementById('app') as HTMLElement;
    }

    //获取当前主题
    private initCurrTheme() {
      let themeIndex = localStorage.getItem('theme-index') || '1';
      window.document.documentElement.setAttribute('data-theme',`theme${themeIndex}`);
    }
  }
</script>

<style lang="scss">
@import '~@styles/index.scss';
.app {
  height: 100%;
  overflow-x: hidden;
  overflow-y: scroll;
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
    transform: translateX(20px);
    opacity: 0;
  }
  .main {
    min-height: calc(100vh - 243px);
  }
  .min-width {
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
  a {
    &:hover {
      @include font_color($font-theme1-color);
    }
  }
  @Media (max-width:999px) {
    .section  {
      width: 95%;
    }
  }
}

.confirm-dialog-wp {
    .el-button--primary {
        color: #fff;
    }
}
</style>