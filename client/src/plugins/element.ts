import {
    Button,
    Input,
    Message,
    Pagination
} from 'element-ui';
export default {
    install(V:any) {
        V.use(Button)
        V.use(Input)
        V.use(Pagination)
        V.prototype.$message = Message;
    }
}