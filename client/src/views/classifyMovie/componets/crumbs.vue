<template>
    <div class="crumbs-wp">
        <div class="crumbs">
            <span>当前位置&nbsp;：&nbsp;&nbsp;</span> 
            <router-link to="/" class="transition">万寻电影>&nbsp;&nbsp;</router-link>
            <span class="top transition" @click.stop="goIndex">{{typeZhName}}> ></span>
            <span>迅雷下载页面</span>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component({
    name: 'crumbs'
})
export default class extends Vue{
    @Prop({ required: true, default: 'action' }) private typeEnName!: string
    @Prop({ required: true, default: '动作片'}) private typeZhName!: string

    private goIndex() {
        this.$emit('get-index-page-data');
    }
}
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
        .top {
            color: $font-blue-color;
            cursor: pointer;
            &:hover {
                color: $font-theme-color;
            }
        }
    }
}
</style>