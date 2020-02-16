import { Component,Watch,Vue} from 'vue-property-decorator';

@Component({
    name: 'scrollBackMixin'
})

export default class extends Vue {
    activated() {
        setTimeout(() => {
            (<HTMLElement>document.getElementById('app')).scrollTop = this.$route.meta.scrollTop;
        },20);
    }
}