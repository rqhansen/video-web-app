import { Component,Watch,Vue} from 'vue-property-decorator';

@Component({
    name: 'scrollBackMixin'
})

export default class extends Vue {
    activated() {
        setTimeout(() => {
            (document.getElementById('app') as HTMLElement).scrollTop = this.$route.meta.scrollTop;
        },20);
    }
}