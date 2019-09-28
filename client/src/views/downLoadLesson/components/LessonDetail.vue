<template>
    <div class="lesson-detail">
        <div class="detail">
            <p class="step">1.&nbsp;新版迅雷中,右键点击出错的下载文件,弹出菜单中选择：种子文件另存为</p>
            <p class="img-wp"><img src="@/assets/images/downLoadLesson/step_01.png"></p>
            <p class="step">2.&nbsp;将种子另存为.torrent文件,点击保存，生成如下的种子文件</p>
            <p class="img-wp"><img src="@/assets/images/downLoadLesson/step_02.png"></p>
            <p class="img-wp"><img src="@/assets/images/downLoadLesson/step_03.png"></p>
            <p class="step">3.&nbsp;打开下载的迅雷5.exe文件</p>
            <p class="img-wp"><img src="@/assets/images/downLoadLesson/step_04.png"></p>
            <p class="step">4.&nbsp;选择文件--打开BT种子文件</p>
            <p class="img-wp"><img src="@/assets/images/downLoadLesson/step_05.png"></p>
            <p class="step">5.&nbsp;种子标题可选输入,点击确定按钮</p>
            <p class="img-wp"><img src="@/assets/images/downLoadLesson/step_06.png"></p>
            <p class="img-wp">6.&nbsp;开始下载</p>
            <p class="img-wp"><img src="@/assets/images/downLoadLesson/step_07.png"></p>
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