import Vue from 'vue'
import elementUi from '@/plugins/element';
import router from './router'
import store from './store/index'
import App from './App.vue'
import './registerServiceWorker'

Vue.use(elementUi);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
