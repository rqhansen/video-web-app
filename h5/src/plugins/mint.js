import {
    Lazyload,
    Loadmore,
    MessageBox
} from 'mint-ui';

export default {
    install(V) {
        V.use(Lazyload),
        V.component(Loadmore.name,Loadmore),
        V.prototype.$Message = MessageBox
    }
}