<template>
    <div class="crumbs-wp">
        <div class="crumbs ellipsis">
            <span>{{$t('titleBar.currLocation')}}：&nbsp;</span> 
            <router-link to="/" class="transition">{{$t('titleBar.siteName')}}>&nbsp;</router-link>
            <span class="top transition" @click.stop="goIndex">{{typeZhName}}>></span>
            <span class="ellipsis movie-name">{{downText}} {{$t('crumbs.downLoad')}}</span>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component({
    name: 'Crumbs'
})
export default class extends Vue{
    @Prop({ 
        required: true, 
        default: 'action'
    }) private typeEnName!: string
    @Prop({ 
        required: true
    }) private typeZhName!: string
    @Prop({}) private movieName!: string

    get downText() {
        // const des = this.movieName || '迅雷';
        if(!this.movieName) {
            return window.vm.$t('crumbs.thunder');
        }
        return this.movieName;
        // return `${des}下载页面`; 
    }
    private goIndex() {
        this.$emit('get-index-page-data');
    }
}
</script>

<style lang="scss" scoped>
.crumbs-wp { 
    max-width: 450px;
    .crumbs {
        .top {
            color: $font-blue-color;
            cursor: pointer;
            &:hover {
                @include font_color($font-theme1-color);
            }
        }
        .movie-name {
            display: inline-block;
            vertical-align: bottom;
            max-width: 260px;
        }
    }
}
</style>