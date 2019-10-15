import {VuexModule, Module, Mutation,Action,getModule} from 'vuex-module-decorators';
import store from '@/store';
import { IScrollTopState } from '@/interface/IScrollTopState';

@Module({dynamic: true,store,name: 'scrollTopState'})
class scrollTopState extends VuexModule implements IScrollTopState{
    public scrollTop = 0

    @Mutation 
    CHANGE_SCROLL_TOP(payload: number) {
        this.scrollTop = payload;
    }

    @Action({commit: 'CHANGE_SCROLL_TOP'})
    changeScrollTop(payload: number) {
        return payload;
    }
}

export const ScrollTopModule = getModule(scrollTopState);