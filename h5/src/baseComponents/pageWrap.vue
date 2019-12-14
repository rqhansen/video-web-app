<template>
    <section class="page-wp">
        <div class="main">
            <div class="m-content">
                <slot name="main"></slot>
            </div>
            <slot name="bottom"></slot>
        </div>
                <!-- 回顶部 -->
        <back-top target=".main"/>
    </section>
</template>

<script>
    export default {
        name: 'PageWrap'
    }
</script>

<style lang="scss" scoped>
.page-wp {
    .main {
        height: 100%;
        overflow-x: hidden;
        overflow-y: auto;   
        -webkit-overflow-scrolling: touch;
        .m-content {
            padding: 60px 16px 20px;
        }
    }
}
</style>