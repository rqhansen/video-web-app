import {
    Button,
    Input,
    Message,
    Pagination,
    Backtop,
    Icon,
} from 'element-ui';
export default {
    install(V:any) {
        V.use(Button)
        V.use(Input)
        V.use(Pagination)
        V.use(Backtop)
        V.use(Icon)
        V.prototype.$message = Message;
    }
}