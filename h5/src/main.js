import 'core-js/features/promise'; 
import Vue from 'vue'
import App from './App.vue'
import store from './store'
import './registerServiceWorker'
import './assets/iconfont/iconfont.css';
// 按需引入mint-ui
import mint from '@/plugins/mint.js';
Vue.use(mint);
// 引入fastclick,防止延迟点击
import fastclick from 'fastclick';
fastclick.attach(document.body);

Vue.config.productionTip = false

new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
