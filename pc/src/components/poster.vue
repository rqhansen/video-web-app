<template>
    <div class="poster-wp" ref="posterWp">
        <div class="poster">
            <a class="img-wp" :title="mName">
                <img ref="img" class="lazy-img" width="auto" height="auto" 
                    src="/common/images/lazy-load.jpg"
                    :data-src="`/common/${src}`"
                    @load.stop="firstLoadImg"
                />
            </a>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Prop, Watch, Vue } from 'vue-property-decorator';
import { getClientHeight } from '@/utils/getClientSize';
import { ScrollTopModule } from '@/store/modules/scrollTop';

@Component({
    name: 'Poster'
})
export default class extends Vue {
    @Prop({
        required: true,
    }) private src!: string
    @Prop() private mName!: string
    
    get iScrollTop () {
        return ScrollTopModule.scrollTop;
    }

    @Watch('iScrollTop') 
    private handleScrollTop() {
        const flag = this.isCanLoadImg();
        if(flag) {
            const img = <HTMLImageElement>this.$refs['img'];
            if(!img.hasAttribute('data-src')) return;
            this.loadImg();
        }
    }

    //第一次进来加载图片
    private firstLoadImg() {
        const img = <HTMLImageElement>this.$refs['img'];
        if(!img.hasAttribute('data-src')) return;
        const flag = this.isCanLoadImg();
        if(flag) {
            this.loadImg();
        }
    }

    private isCanLoadImg() {
        const clientHeight = getClientHeight();
        const posterWp = <Element>this.$refs['posterWp'];
        const scrollTop = posterWp.getBoundingClientRect().top;
        return scrollTop <= clientHeight;
    }

    private loadImg() {
        const img = <HTMLImageElement>this.$refs['img'];
        img.src = <string>img.getAttribute('data-src');
        img.removeAttribute('data-src');
    }
}
</script>

<style lang="scss">
    .poster-wp {
        width: 100%;
        height: 100%;
        .poster {
            position: relative;
            width: 100%;
            height: 0;
            padding-top: 121.5%;
            overflow: hidden;
            .lazy-img {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
            }
        }
        .img-wp {
            display: block;
            width: 100%;
            height: 100%;
        }
    }
</style>