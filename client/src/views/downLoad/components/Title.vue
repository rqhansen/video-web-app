<template>
    <div class="title">
        <dl>
            <dt>
                <img src="@/assets/images/downLoad/xunlei_icon.jpg" alt="" width="40" height="40">
            </dt>
            <dd>
                <h1>迅雷5&nbsp;&nbsp;官方无限制版</h1>
                <a href="" class="transition">查看下载教程</a>
            </dd>
        </dl>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    @Component({
        name: 'Title'
    })
    export default class extends Vue {} 
</script>

<style lang="scss" scoped>
    .title {
        margin-bottom: 15px;
        line-height: 42px;
        font-size: 22px;
        border-bottom: 1px solid #ececec;
        dt {
            display: inline-block;
            vertical-align: top;
            height: 42px;
        }
        dd {
            display: inline-block;
            vertical-align: top;
            h1 {
                display: inline-block;
                margin: 0 10px;
                font-size: 22px;
            }
            a {
                font-size: 16px;
                &:hover {
                    color: $font-theme-color;
                }
            }
        }
    }
</style>