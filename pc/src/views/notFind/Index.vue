<template>
<div class="not-find">
    <div class="section">
        <p class="expression">o(╥﹏╥)o</p>
        <p class="tip">页面找不到了!</p>
        <p><a href="/" target="_self">返回首页</a></p>
    </div>
</div>
</template>

<script lang='ts'>
import { Component,Vue } from 'vue-property-decorator';
import { mixins } from 'vue-class-component';
import scrollBackMixin from '@/mixins/scrollBack';

@Component({
    name: 'notFind'
})

export default class extends mixins(scrollBackMixin) {}
</script>

<style lang="scss" scoped>
.not-find {
    .section {
        padding-top: 100px;
        text-align: center;
    }
    .expression {
        font-size: 48px;
        line-height: 50px;
        margin-bottom: 50px;
    }
    .tip {
        font-size: 36px;
        line-height: 72px;
    }
    .tip +p{
        font-size: 20px;
        line-height: 40px;
        letter-spacing: 0;
    }
    .tip+p a{
        color: #5193c7;
    }
}
</style>