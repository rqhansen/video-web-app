<template>
<section class="down-load-thunder-box">
    <header class="down-load-title">
        <div class="thunder-icon"></div>
        <h1>迅雷5&nbsp;官方无限制版</h1>
        <router-link to="/downLesson">查看教程</router-link>
    </header>
    <div class="down-list-box">
        <div class="down-list">
            <ul>
                <li v-for="item of downList" :key="item.title">
                    <router-link :to="`http://www.wx520.net/${item.url}`" download="xunlei5_pc" class="transition">
                        <i></i><span>{{item.title}}</span>
                    </router-link>
                </li>
            </ul>
        </div>
    </div>
</section>
</template>

<script>
export default {
    name: 'DownLoadThunder',
    data() {
        return {
            downList: [
                {
                    title: '迅雷5PC版下载',
                    url: 'public/files/xunlei5_pc.zip'
                },
                {
                    title: '迅雷5安卓APK下载',
                    url: 'public/files/xunlei5_pc.zip'
                }
            ]
        }
    }
}
</script>

<style lang="scss" scoped>
$url: '~@images/downLoad';
.down-load-thunder-box {
    .down-load-title {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        font-size: 32px;
        padding: 0 16px;
        margin-bottom: 15px;
        height: 84px;
        border-bottom: 1px solid #ececec;
        .thunder-icon {
            width: 60px;
            height: 60px;
            background: url('#{$url}/xunlei_icon.jpg') no-repeat ;
        }
        h1 {
            font-weight: normal;
            margin: 0 25px;
        }
    }
    .down-list-box {
        .down-list {
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
}
</style>