<template>
    <section class="m-detail">
        <section class="detail-wp">
            <current :currMovieInfo="currBarInfo"/>
            <div class="m-text">
                <h1>{{mDetail.fullName}}</h1>
                <div class="m-name-wp">
                    <span>片名：</span>
                    <span class="m-name">{{mDetail.pureName}}</span>
                    <span>发布时间：</span>
                    <time class="pub-date">{{mDetail.pubDate}}</time>
                </div>
                <div class="m-intro-wp">
                    <p>{{mDetail.pureName}}迅雷下载地址和剧情：<span class="share">点此分享本影片</span></p>
                    <img class="poster" :src="`http://www.wx520.net/public/${mDetail.detailImgSrc}`" alt="">
                    <p v-if="mDetail.transName && mDetail.transName!== ' '">
                        <span class="title">◎译&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span><span>{{mDetail.transName}}</span>
                    </p>
                    <p v-if="mDetail.subPureName && mDetail.subPureName!== ' '">
                        <span class="title">◎片&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span><span>{{mDetail.subPureName}}</span>
                    </p>
                    <p v-if="mDetail.year && mDetail.year!==' '">
                        <span class="title">◎年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;代</span><span>{{mDetail.year}}</span>
                    </p>
                    <p v-if="mDetail.country && mDetail.country!=' '">
                        <span class="title">◎产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地</span><span>{{mDetail.country}}</span>
                    </p>
                    <p v-if="mDetail.types && mDetail.types!=' '">
                        <span class="title">◎类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span><span>{{mDetail.types}}</span>
                    </p>
                    <p v-if="mDetail.language && mDetail.language!=' '">
                        <span class="title">◎语&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;言</span><span>{{mDetail.language}}</span>
                    </p>
                    <p v-if="mDetail.caption && mDetail.caption!=' '">
                        <span class="title">◎字&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;幕</span><span>{{mDetail.caption}}</span>
                    </p>
                    <p v-if="mDetail.onDate && mDetail.onDate!=' '">
                        <span class="title">◎上映日期</span><span>{{mDetail.onDate}}</span>
                    </p>
                    <p v-if="mDetail.imdbScore && mDetail.imdbScore!=' '">
                        <span class="title">◎IMDb评分</span><span>{{mDetail.imdbScore}}</span>
                    </p>
                    <p v-if="mDetail.imdbLink && mDetail.imdbLink!=' '">
                        <span class="title">◎IMDb链接</span><span>{{mDetail.imdbLink}}</span>
                    </p>
                     <p v-if="mDetail.format && mDetail.format!=' '">
                        <span class="title">◎格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;式</span><span>{{mDetail.format}}</span>
                    </p>
                    <p v-if="mDetail.fileSize && mDetail.fileSize!=' '">
                        <span class="title">◎文件大小</span><span>{{mDetail.fileSize}}</span>
                    </p>
                    <p v-if="mDetail.videoSize && mDetail.videoSize!=' '">
                        <span class="title">◎视频尺寸</span><span>{{mDetail.videoSize}}</span>
                    </p>
                    <p v-if="mDetail.filmLength && mDetail.filmLength!=' '">
                        <span class="title">◎片&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长</span><span>{{mDetail.filmLength}}</span>
                    </p>
                    <p v-if="mDetail.doubanScore && mDetail.doubanScore!=' '">
                        <span class="title">◎豆瓣评分</span><span>{{mDetail.doubanScore}}</span>
                    </p>
                    <p v-if="mDetail.doubanLink && mDetail.doubanLink!=' '">
                        <span class="title">◎豆瓣链接</span><span>{{mDetail.doubanLink}}</span>
                    </p>
                    <p v-if="mDetail.director && mDetail.director!=' '">
                        <span class="title">◎导&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;演</span><span>{{mDetail.director}}</span>
                    </p>
                    <p v-if="mDetail.editor && mDetail.editor!=' '">
                        <span class="title">◎编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剧</span><span>{{mDetail.editor}}</span>
                    </p>
                    <template v-if="mDetail.actor && mDetail.actor!=' '">
                        <p>
                            <span class="title">◎主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;演</span><span>{{mDetail.actor[0]}}</span>
                        </p>
                        <p v-for="(item,idx) of mDetail.actor.slice(1)" :key="`actor${idx}`">
                            <span class="title"></span><span>{{item}}</span>
                        </p>
                    </template>
                    <p class="margin label" v-if="mDetail.label && mDetail.label!=' '">
                        <span class="title">◎标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签</span><span>{{mDetail.label}}</span>
                    </p>
                    <template v-if="mDetail.shortIntro && mDetail.shortIntro!=' '">
                        <div class="margin">
                            <span class="title">◎简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</span>
                        </div>
                         <p v-for="(item,idx) of mDetail.shortIntro" :key="`intro${idx}`">
                            <span class="title brief-intro"></span><span>{{item}}</span>
                        </p>
                    </template>
                    <template v-if="mDetail.getAward && mDetail.getAward!=' '">
                        <div class="margin">
                            <span class="title award-tit">◎获&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;奖</span>
                        </div>
                         <p v-for="(item,idx) of mDetail.getAward" :key="`award${idx}`">
                            <span class="title award-list"></span><span>{{item}}</span>
                        </p>
                    </template>
                </div>
                <div class="bot">
                    <h3>下载地址:</h3>
                    <a
                         v-for="(url,idx) of mDetail.downUrl" 
                         :key="`downUrl${idx}`" 
                         :href="url"
                         target="__self"
                         class="down-url transition ellipsis"
                     >
                     {{url}}
                     </a>
                      <div class="down-tip">
                         <span>温馨提示:&nbsp;</span>使用迅雷您可以边下边播，如遇迅雷下载出错可换用<router-link to="/download" target="_blank">无限制版迅雷</router-link>
                     </div>
                </div>
            </div>
        </section>
    </section>
</template>

<script>
import Current from './components/current.vue';
import { getMovieDetail } from '@/apis/movieDetail.js';
export default {
    name: 'MovieDetail',
    components: { Current },
    data() {
        return {
            mDetail: {},
            currBarInfo: {}
        }
    },
    methods: {
        async getMovieDetail() {
            const { movie_type,id } = this.$route.params;
            const { data : { code, data:  { movieDetail } } } = await getMovieDetail(
                { movieType: movie_type,id: id}
            );
            this.mDetail = movieDetail;
            this.currBarInfo = {
                typeName: movieDetail.typeName,
                filmType: movieDetail.filmType,
                pureName: movieDetail.pureName
            };
        }
    },
    created() {
        this.getMovieDetail();
        if(' '.trim()) {
            console.log(1);
        }

    }
}
</script>

<style lang="scss" scoped>
.m-detail {
    padding-top: 30px;
    overflow-x: hidden;
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
    .detail-wp {
        margin: 0 16px;
        border: 1px solid #4da6ff;
    }
    .m-text {
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
            .m-name {
                margin: 0 40px 0 10px;
            }
            .pub-date {
                margin-left: 10px;
            }
        }
        .m-intro-wp {
            margin: 20px 0;
            padding: 0 15px;
            line-height: 44px;
            color: #333;
            .share {
                color: #106492;
                margin-left: 10px;
            }
            img {
                display: block;
                width:1200px;
                max-width: 100%;
                max-height:800px;
                margin: 15px 0 30px;
            }
            .title {
                display: inline-block;
                width: 140px;
                margin-right: 10px;
            }
            .label {
                margin-top: 50px;
            }
            .margin {
                margin: 32px 0;
            }
            .brief-intro {
                width: 64px;
            }
            .award-tit {
                width: 120px;
            }
            .award-list {
                width: 64px;
            }
        }
        .bot {
            padding: 0 15px 30px;
            h3 {
                color: #f00;
                line-height: 32px;
                margin-bottom: 10px;
                font-weight: bold;
            }
            .down-url {
                display: block;
                padding: 10px;
                line-height: 36px;
                color: #106492;
                background-color: #ffb;
                border: 1px #ff8c00 solid;
            }
            .down-tip {
                margin-top: 12px;
                color: #106492;
                font-size: 24px;
                a {
                    color: #be1204;
                }
            }
        }
    }
}
</style>