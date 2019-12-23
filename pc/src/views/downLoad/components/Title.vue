<template>
    <div class="down-load-title">
        <dl>
            <dt>
                <img src="/common/images/downLoad/xunlei_icon.jpg" alt="" width="40" height="40">
            </dt>
            <dd>
                <h1>{{$t('downLoad.thunder')}}&nbsp;&nbsp;{{$t('downLoad.officeNoLimit')}}</h1>
                <router-link to="/downloadlesson" class="transition">{{$t('downLoad.scanLesson')}}</router-link>
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
    .down-load-title {
        margin-bottom: 15px;
        line-height: 42px;
        font-size: 22px;
        border-bottom: 1px solid #ececec;
        overflow: hidden;
        dt {
            display: inline-block;
            vertical-align: top;
            height: 42px;
        }
        dd {
            display: inline-block;
            vertical-align: top;
            height: 42px;
            h1 {
                display: inline-block;
                vertical-align: top;
                margin: 0 10px;
                font-size: 22px;
            }
            a {
                display: inline-block;
                line-height: initial;
                font-size: 16px;
                &:hover {
                    @include font_color($font-theme1-color);
                }
            }
        }
    }
</style>