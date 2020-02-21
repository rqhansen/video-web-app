
import {
    Button,
    Dialog,
    Dropdown,
    DropdownMenu,
    DropdownItem,
    Input,
    Message,
    MessageBox,
    Pagination,
    Backtop,
    Icon,
    Form,
    FormItem,
    Option,
    Select
} from 'element-ui';
export default {
    install(V:any) {
        V.use(Button)
        V.use(Dropdown),
        V.use(DropdownMenu),
        V.use(DropdownItem)
        V.use(Dialog)
        V.use(Input)
        V.use(Pagination)
        V.use(Backtop)
        V.use(Icon),
        V.use(Form),
        V.use(FormItem),
        V.use(Option),
        V.use(Select),
        V.prototype.$message = Message;
        V.prototype.$msgbox = MessageBox;
        V.prototype.$alert = MessageBox.alert;
        V.prototype.$confirm = MessageBox.confirm;
        V.prototype.$prompt = MessageBox.prompt;
    }
}