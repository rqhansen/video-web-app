import Vue from 'vue';
import Vuex from 'vuex';
import {ISearchState} from '@/interface/ISearchState'
import {IScrollTopState} from '@/interface/IscrollTopState';


Vue.use(Vuex);

export interface IRootState {
    searchInfo: ISearchState,
    scrollTop: IScrollTopState
}


export default new Vuex.Store<IRootState>({});