<template>
    <div class="thunder-title-box">
        <slot></slot>
    </div>
</template>

<script>
export default {
    name: 'ThunderTitle'
}
</script>

<style lang="scss" scoped>
.thunder-title-box {
    padding: 0 16px;
    height: 84px;
    border-bottom: 1px solid #ececec;
    font-size: 32px;
}
</style>