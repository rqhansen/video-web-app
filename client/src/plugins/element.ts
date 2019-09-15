import {
    Button,
    Input,
    Message,
} from 'element-ui';
export default {
    install(V:any) {
        V.use(Button)
        V.use(Input)
        V.prototype.$message = Message;
    }
}