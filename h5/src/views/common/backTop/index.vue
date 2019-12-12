<template>
    <aside class="back-top-box">
        <div class="back-top">
            <i class="iconfont iconback-top"></i>
        </div>
        <div class="bg"></div>
    </aside>
</template>

<script>

</script>

<style lang="scss" scoped>
.back-top-box {
    position: fixed;
    right: 50px;
    bottom: 80px;
    z-index:999;
    .iconfont {
        position: relative;
        z-index: 1;
        font-size: 80px;
        color: #106482;
    }
    .bg {
        position: absolute;
        left: 20px;
        top: 26px;
        z-index: 0;
        width: 35px;
        height: 35px;
        background-color:#fff;
    }
}
</style>