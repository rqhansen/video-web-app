<template>
    <div class="header">
        <!-- 热门电影 -->
        <div class="hot-m-wp">
            <div class="hot-m">
                <hot-movie/>
            </div>
        </div>
        <!-- logo及搜索 -->
    </div>
</template>

<script lang="ts">
    import {Component,Prop,Vue} from 'vue-property-decorator';
    import HotMovie from './components/HotMovie.vue';

    @Component({
        name:'Header',
        components: {
            HotMovie
        }
    })

    export default class Header extends Vue {
        
    }
</script> 

<style lang="less" scoped>
    .header {
        .hot-m-wp {
            box-shadow: 0 1px 10px 0 #d9d9d9;
            .hot-m {
                width: 1000px;
                margin: 0 auto;
            }
        }
    }
</style>