<template>
    <transition name="pull-up">
        <aside v-if="visible" class="back-top-box" @click.stop="scrollToTop">
            <div class="back-top">
                <i class="iconfont iconback-top"></i>
            </div>
        </aside>
    </transition>
</template>

<script>
import { throttle } from '@/utils/throttle.js';
export default {
    name: 'BackTop',
    props: {
        visibilityHeight: {
            type:Number,
            default: 1200
        },
        target: [String]
    },
    data() {
        return {
            visible: false,
            el: null
        }
    },
    mounted() {
        this.init();
        this.throttledScrollHandler = throttle(this.onScroll);
        this.el.addEventListener('scroll',this.onScroll);
    },
    methods: {
        init() {
            this.el = document.querySelector(this.target);
            if(!this.el) {
                throw new Error(`target is not existed: ${this.target}`);
            }
        },
        onScroll() {
            const scrollTop = this.el.scrollTop;
            this.visible = scrollTop >= this.visibilityHeight;
        },
        scrollToTop() {
            let el = this.el;
            let step = 0;
            let interval = setInterval(() => {
                if(el.scrollTop <= 0) {
                    clearInterval(interval);
                    return;
                }
                step += 10;
                el.scrollTop -= step;
            },20)
        }
    },
    beforeDestroy() {
        this.el.removeEventListener('scroll',this.throttledScrollHandler);
    }
}
</script>

<style lang="scss" scoped>
.pull-up-enter,.pull-up-leave-to {
    transform: translateY(100px);
    opacity: 0;
}
.pull-up-enter-active,.pull-up-leave-active {
    transition: all .4s cubic-bezier(1,.04,.06,.97);
}
.back-top-box {
    position: fixed;
    right: 30px;
    bottom: 80px;
    width: 100px;
    height: 101px;
    z-index:999;
    .iconfont {
        position: relative;
        z-index: 1;
        width: 100%;
        height: 100%;
        font-size: 100px;
        color: #106482;
    }
}
</style>