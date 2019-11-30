import {
    Lazyload,
    Loadmore
} from 'mint-ui';

export default {
    install(V) {
        V.use(Lazyload),
        V.component(Loadmore.name,Loadmore)
    }
}