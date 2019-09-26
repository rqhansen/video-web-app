import Vue from 'vue';
import Vuex from 'vuex';
import {ISearchState} from './modules/search';

Vue.use(Vuex);

export interface IRootState {
    searchInfo: ISearchState
}

// const store = new Vuex.Store({
//     modules: {
//         page
//     }
// })

export default new Vuex.Store<IRootState>({});
// export default store