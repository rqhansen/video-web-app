<template>
    <div class="title-wp clearfix">
        <h2>{{title}}</h2>
        <span v-if="isShowMore" class="more transition" @click.stop="more">更多...</span>
    </div>  
</template>

<script lang="ts">
    import {Component,Prop,Vue} from 'vue-property-decorator';
    import { Route } from 'vue-router';

    @Component({
        name: 'titleBar'
    })

    export default class extends Vue {
      @Prop({default:'今日热门电影推荐'}) private title!: string
      @Prop({default: '/moreMovie'}) private url!: string
      @Prop({default: true}) private isShowMore!: boolean

      private more() {
        this.$router.push(`${this.url}`);
      }
    }
</script>

<style lang="scss" scoped>
      .title-wp {
        width: 100%;
        min-width: 720px;
        padding: 0 10px;
        line-height: 40px;
        background-color: #f7f7f7;
      h2 {
        float: left;
        font-size: 16px;
        overflow: hidden;
      }
      .more{
        float: right;
        font-size: 12px;
        font-weight: bold;
        color: $font-blue-color;
        cursor:pointer;
        &:hover {
          color: $font-theme-color;
        }
      }
    }
</style>