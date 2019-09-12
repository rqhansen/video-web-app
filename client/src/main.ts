import Vue from 'vue'
import elementUi from './plugins/element';
import './styles/index.scss';
import App from './App.vue'
// import './utils/rquest.js'
import router from './router'
import store from './store'
import './registerServiceWorker'
Vue.use(elementUi);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
