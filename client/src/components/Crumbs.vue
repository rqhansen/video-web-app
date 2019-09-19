<template>
    <div class="crumbs-wp">
        <div class="crumbs">
            <span>当前位置：&nbsp;</span> 
            <router-link to="/" class="transition">万寻电影>&nbsp;&nbsp;</router-link>
            <span class="top transition" @click.stop="goIndex">{{typeZhName}}> ></span>
            <span>{{downText}}</span>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component({
    name: 'crumbs'
})
export default class extends Vue{
    @Prop({ 
        required: true, 
        default: 'action'
    }) private typeEnName!: string
    @Prop({ 
        required: true, 
        default: '动作片'
    }) private typeZhName!: string
    @Prop({}) private movieName!: string

    get downText() {
        const des = this.movieName || '迅雷';
        return `${des}下载页面`; 
    }
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