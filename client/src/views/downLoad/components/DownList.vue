<template>
    <div class="down-list-wp">
        <ul>
            <li >
                <a class="transition" href="http://www.wx520.net/public/files/xunlei5_pc.zip" download="xunlei5_pc" alt="迅雷5PC版无限制"
                target="_self">
                <i></i>
                <span>迅雷5PC版下载</span>
                </a>
            </li>
            <li>
                <a class="transition" href="http://www.wx520.net/public/files/xunlei5.32.2_apk.zip" download="xunlei5.32.2_apk"
                    alt="迅雷5安卓APK无限制版" target="_self">
                    <i></i>
                    <span>迅雷5安卓APK下载</span>
                </a>
            </li>
        </ul>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';

    @Component({
        name: 'downLoadList'
    })

    export default class extends Vue {

    }
</script>

<style lang="scss" scoped>
    .down-list-wp {
        li {
            display:inline-block;
            margin-right: 10px;
            overflow: hidden;
        }
        a {
            display: block;
            width: 266px;
            height: 62px;
            padding: 0 20px;
            line-height: 62px;
            font-size: 20px;
            color: #fff;
            background-color: $font-theme-color;
            font-weight: normal;
            &:hover {
                background-color: $font-theme-color*0.95;
            }
        }
        i {
            display: inline-block;
            vertical-align: middle;
            width: 33px;
            height: 33px;
            margin-right: 15px;
            background: url('../../../assets/images/downLoad/download.png') no-repeat;
        }
    }
</style>