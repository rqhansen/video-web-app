import { Component, Watch, Vue } from 'vue-property-decorator';
import { setTitle, setMeta } from '@/utils/setMeta';

@Component({
    name: 'setTitleAndMetaMixin'
})

export default class extends Vue {
    private allRouteNames = ['home','downLoad','downLoadLesson','moreMovie','todayMovie','weekMovie'];

    @Watch('$i18n.locale')
    private setTitleAndMeta() {
        if(!this.allRouteNames.includes(<string>this.$route.name)) {
            return;
        }
        this.resetTitleAndMeta();
    }


     private beforeRouteEnter (to: any, form: any, next: (param: Function) => void) {
        next((vm:any) => {
          vm.resetTitleAndMeta();
        });
      }
    private resetTitleAndMeta() {
        const vm = window.vm;
        this.changeTitleAndMeta(
            vm.$t('title.indexTitle'),
            vm.$t('title.indexKeyWords'),
            vm.$t('title.indexDesription')
        );
    }
    public changeTitleAndMeta(title: string,keywords:string,description:string) {
        setTitle(title);
        setMeta('keywords','keywords',keywords);
        setMeta('description','description',description);
    }
}