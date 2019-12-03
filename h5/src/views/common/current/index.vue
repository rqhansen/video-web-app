<template>
    <nav class="curr-wp">
        <slot name="currWp"></slot>
    </nav>
</template>

<script>
export default  {
    name: 'CurrBg'
}
</script>

<style lang="scss" scoped>
.curr-wp {
    height: 60px;
    padding: 0 15px;
    background-color: #f7f7f7;
    line-height: 60px;
    color: #333;
}
</style>