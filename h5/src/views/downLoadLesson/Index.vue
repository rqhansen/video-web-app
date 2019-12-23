<template>
<section class="down-load-lesson-box">
    <div class="down-load-lesson">
        <thunder-title class="lesson-title">
            <div class="">迅雷5下载教程</div>
        </thunder-title>
        <div class="lesson-steps">
            <p class="step">1.&nbsp;新版迅雷中,右键点击出错的下载文件,弹出菜单中选择：种子文件另存为</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_01.png"></p>
            <p class="step">2.&nbsp;将种子另存为.torrent文件,点击保存，生成如下的种子文件</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_02.png"></p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_03.png"></p>
            <p class="step">3.&nbsp;打开下载的迅雷5.exe文件</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_04.png"></p>
            <p class="step">4.&nbsp;选择文件--打开BT种子文件</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_05.png"></p>
            <p class="step">5.&nbsp;种子标题可选输入,点击确定按钮</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_06.png"></p>
            <p class="step">6.&nbsp;开始下载</p>
            <p class="img-wp"><img src="/common/images/downLoadLesson/step_07.png"></p>
        </div>  
    </div>
    <Footer/>
</section>
</template>
<script>
import ThunderTitle from '@/views/common/thunderTitle';
export default {
    components: {
        ThunderTitle
    }
}
</script>

<style lang="scss" scoped>
.down-load-lesson-box {
        overflow: auto;
        -webkit-overflow-scrolling: touch;
    .down-load-lesson {
        padding: 20px 14px 0;
        .lesson-title {
            width: 100%;
            height: 84px;
            margin-bottom: 20px;
            font-size: 36px;
            line-height: 84px;
            border-bottom: 1px solid #ececec;
        }
        .lesson-steps {
            .step {
                min-height: 30px;
                line-height: 30p
            }
            >p {
                width: 100%;
                word-break: break-all;
            }
            .img-wp {
                margin: 10px 0;
            }
            img {
                width: 100%;
                height: 100%;
            }
        }
    }  
}
</style>