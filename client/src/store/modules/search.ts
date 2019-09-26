import { VuexModule, Module, Mutation, Action, getModule} from 'vuex-module-decorators';
import store from '@/store';

export interface ISearchState {
    searchInfo: {
        page: string, 
        movieName: string
    }
}

@Module({dynamic: true, store, name: 'searchState'})
class SearchState extends VuexModule implements ISearchState {
    public searchInfo = {
        page: '1',
        movieName: ''
    }
    @Mutation
    CHANGE_SEARCH_INFO(payload: {page: string, movieName: string}) {
        this.searchInfo = payload;
    }

    @Action({commit: 'CHANGE_SEARCH_INFO'}) 
    changeSearchInfo(payload: {page: string, movieName: string}) {
        return payload
    }
}

export const SearchModule = getModule(SearchState);
