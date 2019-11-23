<template>
    <header class="curr-bar ellipsis">
        <span class="curr-txt">当前位置：</span>
        <router-link to="/" target="_self">万寻电影></router-link>
        <router-link to="/">djjss</router-link>
        <span>>>下载页面</span>
    </header>
</template>

<script>
export default {
    name: 'Current'
}
</script>

<style lang="scss">
.curr-bar{
    height: 60px;
    padding: 0 15px;
    border-bottom: 1px solid #bfe4ff;
    background-color: #f7f7f7;
    line-height: 60px;
    color: #333;
    .curr-txt {
        margin-right: 5px;
    }
}
</style>