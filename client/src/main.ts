import Vue from 'vue'
import './style/scss/reset.scss';
import App from './App.vue'
import router from './router'
import store from './store'
import './registerServiceWorker'
import './plugins';
// import './style/scss/variables.scss';

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
