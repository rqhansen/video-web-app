import '@/plugins/es6';
import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import './registerServiceWorker';
import './assets/iconfont/iconfont.css';
// 自动化注册基础组件
import '@/utils/registerComponent.js';
// 按需引入mint-ui
import mint from '@/plugins/mint';
Vue.use(mint);
// 引入fastclick,防止延迟点击
import fastclick from 'fastclick';
fastclick.attach(document.body);

Vue.config.productionTip = false

new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')
