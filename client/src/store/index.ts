import Vue from 'vue';
import Vuex from 'vuex';
// import {ISearchState} from './modules/search';
import {ISearchState} from '@/interface/ISearchState'


Vue.use(Vuex);

export interface IRootState {
    searchInfo: ISearchState
}


export default new Vuex.Store<IRootState>({});