<template>
    <div class="title-wp clearfix">
        <h2>{{title}}</h2>
        <span v-if="isShowMore" class="more transition" @click.stop="more">{{$t('titleBar.more')}}...</span>
    </div>  
</template>

<script lang="ts">
    import {Component,Prop,Vue} from 'vue-property-decorator';
    import { Route } from 'vue-router';

    @Component({
        name: 'titleBar'
    })

    export default class extends Vue {
      @Prop() private title!: string
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
        height: 40px;
        padding: 0 10px;
        line-height: 40px;
        background-color: #f7f7f7;
        overflow: hidden;
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
          @include font_color($font-theme1-color);
        }
      }
    }
</style>