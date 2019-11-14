import {
    Search,
    Button,
    Lazyload
} from 'mint-ui';

export default {
    install(V) {
        V.component(Search.name,Search)
        V.component(Button.name, Button)
        V.use(Lazyload)
    }
}