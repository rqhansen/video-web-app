<template>
    <div class="footer-wp today-width">
        <div class="section">
            <p>
                <span>Copyright © 2019</span>
                <router-link to="/" target="_self" class="transition">万寻资源网</router-link>
                <span>Powered by wx520.net</span>
            </p>
            <p>本站所有内容均来自互联网，我们不提供影片资源存储、录制和上传！请下载后24小时内删除，不可用于商业传播，否则产生的一切后果将由您自己承担！</p>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    @Component({
        name: 'commonFooter',
    })

    export default class extends Vue {}
</script>

<style lang="scss" scoped>
    .footer-wp {
        padding: 10px;
        text-align: center;
        color: $font-footer-color;
        line-height: 22px;
        font-size: 12px;
        border-top: 2px solid $font-theme-color;
        overflow: hidden;
        a {
            margin: 0 4px;
            cursor: pointer;
            &:hover {
                color: $font-theme-color;
            }
        }
    }
</style>