<template>
    <footer>
        <p>
            <span>Copyright © 2019</span>
            <router-link to="/" target="_self">万寻资源网</router-link>
            <span>Powered by wx520.net</span>
        </p>
        <p>本站所有内容均来自互联网，我们不提供影片资源存储、录制和上传！请下载后24小时内删除，不可用于商业传播，否则产生的一切后果将由您自己承担！</p>
    </footer>
</template>

<script>
    export default {
        name: 'Footer'
    }
</script>

<style lang="scss" scoped>
footer {
    border-top: 2px solid #5193c7;
    padding: 20px;
    overflow: hidden;
    text-align: center;
    color: #666;
    line-height: 44px;
    font-size: 24px;
    .router-link-active {
        margin-right: 5px;
    }
}
</style>