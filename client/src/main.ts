import Vue from 'vue'
import i18n from '@/lang';
import elementUi from '@/plugins/element';
import router from './router'
import store from './store/index'
import App from './App.vue'
import './registerServiceWorker'

Vue.use(elementUi,{
  i18n: (key: any, value: any) => i18n.t(key, value)
});

Vue.config.productionTip = false

new Vue({
  router,
  store,
  i18n,
  render: h => h(App)
}).$mount('#app')
