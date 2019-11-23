<template>
    <section class="m-detail">
        <section class="detail-wp">
            <current />
            <div class="m-text">
                <h1>双子杀手</h1>
                <div class="m-name-wp">
                    <span>片名：</span>
                    <span class="m-name">浩浩荡荡</span>
                    <span>发布时间：</span>
                    <time>2010-11-29</time>
                </div>
                <div class="m-intro-wp">
                    <p>
                        浩浩荡荡迅雷下载地址和剧情:
                        <span class="share">点此分享本影片</span>
                    </p>
                    <img src="" alt="" style="width:600px;max-height: 80px;">
                    <p name="title"></p>
                </div>
            </div>
        </section>
    </section>
</template>

<script>
import Current from './components/current.vue';
export default {
    name: 'movieDetail',
    components: { Current }
}
</script>

<style lang="scss" scoped>
.m-detail {
    padding-top: 30px;
    .detail-wp {
        margin: 0 16px;
        font-size: 24px;
        border: 1px solid #4da6ff;
        overflow: hidden;
    }
    .m-text {
        overflow: hidden;
        h1 {
            margin: 20px 0 22px;
            line-height: 40px;
            color: #106492;
            text-align: center;
            font-weight: bold;
            font-size: 32px;
        }
        .m-name-wp {
            text-align: center;
            color: #333;
            line-height: 28px;
        }
        .m-name {
            margin: 0 40px 0 10px;
        }
        .m-intro-wp {
            margin: 20px 0;
            padding: 0 10px;
            font-size: 24px;
            line-height: 44px;
            color: #333;
            .share {
                color: #106492;
                margin-left: 10px;
                line-height: 44px;
            }
            img {
                display: block;
                max-width: 100%;
            }
        }
    }
}
</style>