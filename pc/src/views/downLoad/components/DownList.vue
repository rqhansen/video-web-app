<template>
    <div class="down-list-wp" :class="{tiny: $i18n.locale==='en'}">
        <ul>
            <li >
                <a class="transition" href="/common/files/xunlei5.zip" download="xunlei5.zip"
                target="_self">
                <i></i>
                <span>{{$t('downLoad.pcDownLoad')}}</span>
                </a>
            </li>
            <li>
                <a class="transition" href="/common/files/xunlei5.apk" download="xunlei5.apk"
                     target="_self">
                    <i></i>
                    <span>{{$t('downLoad.androidDownLoad')}}</span>
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
        &.tiny {
            a {
                font-size: 16px;
            }
            i {
                width: 26px;
                height: 26px;
                margin-right: 4px;
                background-size: cover;
            }
        }
        li {
            display: inline-block;
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
            text-align: center;
            @include bg_color($font-theme1-color);
            font-weight: normal;
            &:hover {
                @include hover_bg_color($font-theme1-color);
                color: #fff;
            }
        }
        i {
            display: inline-block;
            vertical-align: middle;
            width: 33px;
            height: 33px;
            margin-right: 15px;
            background: url('/common/images/downLoad/download.png') no-repeat;
        }
    }
</style>