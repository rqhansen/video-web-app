import Vue from 'vue'
import Vuex from 'vuex'
import { SET_DROP_MENU_VISIBLE } from './mutation-types';
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    showDropMenu: false
  },
  mutations: {
    [SET_DROP_MENU_VISIBLE](state,payload) {
      state.showDropMenu = payload;
    }
  },
  getters: {
    showDropMenu: state => state.showDropMenu
  },
  actions: {

  },
  modules: {

  }
})
