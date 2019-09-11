import Vue from 'vue'
import './style/less/reset.less';
import App from './App.vue'
import router from './router'
import store from './store'
import './registerServiceWorker'
import './plugins';
import './style/scss/element-variables.scss';

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
