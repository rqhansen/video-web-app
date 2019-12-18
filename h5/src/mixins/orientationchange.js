/**
 * 监听横竖屏
 */
export default {
    methods: {
        orientate() {
            if(window.orientation === 90 || window.orientation === '-90') {
                this.$Message('提示','横屏可能导致页面异常，建议竖屏操作！');
            } 
        }
    },
    mounted(){
        window.addEventListener('orientationchange' in window ? 'orientationchange' : 'resize',this.orientate,false);
    }
}