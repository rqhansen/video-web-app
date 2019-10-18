import Vue from 'vue'
import App from './App.vue'
import store from './store'
import './registerServiceWorker'
import { Button, Cell } from 'mint-ui'
Vue.component(Button.name, Button)
Vue.component(Cell.name, Cell)

Vue.config.productionTip = false

new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
