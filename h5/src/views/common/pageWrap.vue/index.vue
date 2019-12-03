<template>
    <section class="page-wp">
        <div class="main">
                <slot name="main"></slot>
        </div>

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
        padding: 60px 16px 0;
        overflow-x: hidden;
        overflow-y: auto;   
        -webkit-overflow-scrolling: touch;
    }
}
</style>