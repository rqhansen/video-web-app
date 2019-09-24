import { VuexModule, Module, Mutation, Action, getModule} from 'vuex-module-decorators';
import store from '@/store';

export interface IPageState {
    page: string
}

@Module({dynamic: true, store, name: 'page'})
class CurrPage extends VuexModule implements IPageState {
    public page = '1';

    @Mutation
    CHANGE_PAGE(payload: string) {
        this.page = payload;
    }

    @Action({commit: 'CHANGE_PAGE'}) 
    changePage(payload: string) {
        return payload
    }
}

export const PageModule = getModule(CurrPage);
