<template>
<section class="down-load-thunder-box">
    <thunder-title>
        <header  class="down-load-title">
            <div class="thunder-icon"></div>
            <h1>迅雷5&nbsp;官方无限制版</h1>
            <router-link to="/downLoadLesson">查看教程</router-link>
        </header>
    </thunder-title>
    <div class="down-list-box">
        <div class="down-list">
            <ul>
                <li v-for="(item,idx) of downList" :key="item.title">
                    <router-link :to="item.url" :download="idx===0?'xunlei5.zip':'xunlei5.apk'" class="transition">
                        <i></i><span>{{item.title}}</span>
                    </router-link>
                </li>
            </ul>
        </div>
    </div>
    <Footer class="footer"/>
</section>
</template>

<script>
import ThunderTitle from '@/views/common/thunderTitle';
export default {
    name: 'DownLoadThunder',
    components: {
        ThunderTitle
    },
    data() {
        return {
            downList: [
                {
                    title: '迅雷5PC版下载',
                    url: '/common/files/xunlei5.zip'
                },
                {
                    title: '迅雷5安卓APK下载',
                    url: '/common/files/xunlei5.apk'
                }
            ]
        }
    }
}
</script>

<style lang="scss" scoped>
// $url: '~@images/downLoad';
.down-load-thunder-box {
    position: relative;
    .thunder-title-box {
        margin-bottom: 20px;
    }
    .down-load-title {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        height: 100%;
        margin-bottom: 15px;
        .thunder-icon {
            width: 60px;
            height: 60px;
            background: url('/common/images/downLoad/xunlei_icon.jpg') no-repeat ;
        }
        h1 {
            font-weight: normal;
            margin: 0 25px;
        }
    }
    .down-list-box {
        .down-list {
            height: 200px;
            padding: 0 16px;
        }
        li {
            &:not(:last-child) {
                margin-bottom: 20px;
            }
        }
        a {
            display: block;
            width: 532px;
            height: 124px;
            padding: 0 40px;
            line-height: 124px;
            font-size: 40px;
            color: #fff;
            background-color: #5193c7;
            font-weight: normal;
            &:active {
                background-color: rgba(81, 147, 199, .9);
            }
        }
    }
    .footer{
        position: absolute;
        left: 0;
        bottom: 0;
    }
}
</style>