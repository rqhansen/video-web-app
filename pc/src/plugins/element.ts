
import {
    Button,
    Dialog,
    Dropdown,
    DropdownMenu,
    DropdownItem,
    Input,
    Message,
    Pagination,
    Backtop,
    Icon,
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
        V.use(Icon)
        V.prototype.$message = Message;
    }
}