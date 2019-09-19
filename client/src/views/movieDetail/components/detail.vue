<template>
    <div class="m-text">
       <h1>{{mDetail.fullName}}</h1>
       <div class="info">
           <span>片名&nbsp;:</span>
           <span>{{mDetail.pureName}}</span>
           <span>发布时间&nbsp;</span>
           <time>{{mDetail.pubDate}}</time>
       </div>
       <div class="m-body" v-if="!mDetail.fullName">
           空
       </div>
       <div v-else class="m-body">
            <p class="thunder-down">
               <span>{{mDetail.pureName}}迅雷下载地址和剧情：</span>
               <span class="share">点此分享影片</span>
            </p>
            <img :src="`http://www.wx520.net/public/${mDetail.detailImgSrc}`" :alt="mDetail.pureName" width="600px" height="800px" max-height="800px"> 
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
                <span class="title">◎类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型</span><span>{{mDetail.types}}</span>
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
                <p v-for="item of mDetail.actor.slice(1)" :key="item">
                    <span class="title"></span><span>{{item}}</span>
                </p>
            </template>
            <p class="margin label" v-if="mDetail.label && mDetail.label!=' '">
                <span class="title">◎标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签</span><span>{{mDetail.label}}</span>
            </p>
            <template v-if="mDetail.shortIntro && mDetail.shortIntro!=' '">
                <div class="margin">
                    <span class="title" style="width: 68px;">◎简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</span>
                </div>
                 <p v-for="item of mDetail.shortIntro" :key="item">
                    <span class="title" style="width: 32px;"></span><span>{{item}}</span>
                </p>
            </template>
            <template v-if="mDetail.getAward && mDetail.getAward!=' '">
                <div class="margin">
                    <span class="title" style="width: 32px;">◎获&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;奖</span>
                </div>
                 <p v-for="item of mDetial.getAward" :key="item">
                    <span class="title"></span><span>{{item}}</span>
                </p>
            </template>
       </div>
       <div class="bot">
           <h3>下载地址列表:</h3>
           <a
                v-for="(url,idx) of mDetail.downUrl" 
                :key="idx" 
                :href="url"
                target="__self"
                class="down-url transition"
            >
            {{url}}[www.wx520.net]下载
            </a>
             <div class="down-tip">
                <span>温馨提示:&nbsp;</span>使用迅雷您可以边下边播，如遇迅雷下载出错可换用<a href="/html/downThurder" target="_blank">无限制版迅雷</a>!
            </div>
       </div>
    </div>  
</template>

<script lang="ts">
import {Component, Prop, Vue} from 'vue-property-decorator';

@Component({
    name: 'detail'
})

export default class extends Vue{
    @Prop({
        required: true,
        default: () => {}
    }) private mDetail!: object
}
</script>

<style lang="scss" scoped>
    .m-text {
        overflow: hidden;
        h1 {
            margin-bottom: 11px;
            line-height: 42px;
            color: $font-blue-color;
            text-align: center;
            font-weight: bold;
            font-size: 16px;
        }
        .info {
            text-align: center;
            line-height: 14px;
            margin-top: 5px;
            span {
                margin: 0 6px;
            }
        }
        .m-body {
            margin: 20px 0;
            padding: 0 10px;
            font-size: 12px;
            line-height: 22px;
            .thunder-down {
                margin-bottom: 5px;
            }
            .title {
                display: inline-block;
                width: 68px;
                margin-right: 10px;
                line-height:  24px;
            }
            .margin {
                margin: 15px 0;
            }
        }
        .bot {
            padding: 0 10px 20px;
            font-size: 12px;
            h3 {
                color: $font-red-color;
                line-height: 16px;
                margin-bottom: 5px;
            }
            .down-url {
                display: block;
                padding: 5px;
                margin-bottom: 6px;
                line-height: 18px;
                color: $font-blue-color;
                background-color: #ffb;
                border: 1px #ff8c00 solid;
                &:hover {
                    color: $font-red-color;
                }
            }
            .down-tip {
                color: $font-blue-color;
            }
        }
    }
</style>