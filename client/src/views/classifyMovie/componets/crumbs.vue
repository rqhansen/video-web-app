<template>
    <div class="crumbs-wp">
        <div class="crumbs">
            <span>当前位置&nbsp;：&nbsp;&nbsp;</span> 
            <router-link to="/" class="transition">万寻电影>&nbsp;&nbsp;</router-link>
            <router-link to="/" class="transition">动作片> ></router-link>
            <span>迅雷下载页面</span>
        </div>
    </div>
</template>

<script lang="ts">
import { Component,Vue } from 'vue-property-decorator';

@Component({
    name: 'crumbs'
})
export default class extends Vue{}
</script>

<style lang="scss" scoped>
.crumbs-wp { 
    font-size: 0;
    .crumbs {
        height: 27px;
        margin-bottom: 20px;
        border: 1px solid #bfe4ff;
        background-color: #f7f7ff;
        line-height: 27px;
        padding: 0 10px;
        font-size: 12px;
        color: $font-regular-color;
        overflow: hidden;
        .router-link-active {
            &:hover {
                color: $font-theme-color;
            }
        }
    }
}
</style>