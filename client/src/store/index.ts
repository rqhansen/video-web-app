import Vue from 'vue';
import Vuex from 'vuex';
import {IPageState} from './modules/page';

Vue.use(Vuex);

export interface IRootState {
    page: IPageState
}

// const store = new Vuex.Store({
//     modules: {
//         page
//     }
// })

export default new Vuex.Store<IRootState>({});
// export default store