<template>
    <header class="title-bar">
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
.title-bar {
    width: 100%;
    height: 100%;
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