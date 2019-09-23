import * as types from '../type';

const state = {
    page: 1
}

const actions = {
    //相当于commit('setPage')
    //第二个参数可以省略，第一个参数为store
    setPage ( { commit,state } : any, page:string) { 
        commit(types.CURR_SEARCH_PAGE,page);
    }
}

const getters = {
    page: (state: any) => state.page
}

const mutations = {
    [types.CURR_SEARCH_PAGE](state: any, page: string) {
        state.page = page;
    }
}

export default {
    state,
    actions,
    getters,
    mutations
}