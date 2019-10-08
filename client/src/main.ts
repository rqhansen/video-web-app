import Vue from 'vue';
import { Component } from 'vue-property-decorator';
import i18n from '@/lang';
import elementUi from '@/plugins/element';
import router from './router'
import store from './store/index'
import App from './App.vue'
import './registerServiceWorker'

Vue.use(elementUi);

Vue.config.productionTip = false

Component.registerHooks([
  'beforeRouteEnter'
])



window['vm'] = new Vue({
  router,
  store,
  i18n,
  render: h => h(App)
}).$mount('#app')
