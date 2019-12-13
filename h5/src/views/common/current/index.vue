<template>
    <nav class="curr-box">
        <slot name="currWp"></slot>
    </nav>
</template>

<script>
export default  {
    name: 'CurrBg'
}
</script>

<style lang="scss" scoped>
.curr-box {
    height: 60px;
    padding: 0 15px;
    background-color: #f7f7f7;
    line-height: 60px;
    border: 1px solid #bfe4ff;
    margin-bottom: 40px;
    color: #333;
}
</style>