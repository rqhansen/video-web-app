<template>
    <header class="m-title">
        <main>
            <h2 class="title">{{title}}</h2>
            <slot />
        </main>
    </header>
</template>

<script>
export default {
    name: 'TitleBar',
    props: {
        title: {
            default: '今日热门电影推荐'
        }
    }
}
</script>

<style lang="scss" scoped>
.m-title {
    width: 100%;
    height: 100%;
    padding: 0 16px;
    background-color: #f7f7f7;
    overflow: hidden;
    > main {
        width: 100%;
        height: 100%;
        @include flex(space-between);
        .title {
            color: #000;
            font-size: 30px;
        }
    }
} 
</style>