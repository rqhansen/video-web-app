<template>
    <div class="title-wp clearfix">
        <h2>今日热门电影推荐</h2>
        <span class="more transition">更多...</span>
    </div>  
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    @Component({
        name: 'titleBar'
    })

    export default class extends Vue {}
</script>

<style lang="scss" scoped>
      .title-wp {
        width: 100%;
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
        color: $font-blue-color;
        cursor:pointer;
        &:hover {
          color: $font-theme-color;
        }
      }
    }
</style>