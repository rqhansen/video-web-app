<template>
    <div class="lesson-detail">
        <div class="detail">
            <p class="step">1.&nbsp;{{$t('downLoadLesson.step1')}}</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_01.png"></p>
            <p class="step">2.&nbsp;{{$t('downLoadLesson.step2')}}</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_02.png"></p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_03.png"></p>
            <p class="step">3.&nbsp;{{$t('downLoadLesson.step3')}}</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_04.png"></p>
            <p class="step">4.&nbsp;{{$t('downLoadLesson.step4')}}</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_05.png"></p>
            <p class="step">5.&nbsp;{{$t('downLoadLesson.step5')}}</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_06.png"></p>
            <p class="img-wp">6.&nbsp;{{$t('downLoadLesson.step6')}}</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_07.png"></p>
        </div>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    @Component({
        name: 'lessonDetail'
    })
export default class extends Vue {}
</script>

<style lang="scss" scoped>
    .lesson-detail{
        width: 100%;
        .detail {
            padding: 10px 0;
            p {
                width: 100%;
                word-break: break-all;
            }
            .step {
                line-height: 20px;
            }
            .img-wp {
                margin: 5px 0;
            }
            img {
                max-width: 100%;
            }
        }
    }
</style>