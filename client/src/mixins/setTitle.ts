import { Component, Vue } from 'vue-property-decorator';
import { setTitle, setMeta } from '@/utils/setMeta';

@Component({
    name: 'setTitleAndMetaMixin'
})

export default class extends Vue {
    public changeTitleAndMeta(title: string,keywords:string,description:string) {
        const vm = window.vm;
        setTitle(title);
        setMeta('keywords','keywords',keywords);
        setMeta('description','description',description);
    }
}