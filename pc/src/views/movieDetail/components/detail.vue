<template>
    <div class="m-text">
       <h1 class="ellipsis">{{mDetail.fullName}}</h1>
       <div class="info">
           <span>{{$t('movieDetail.subPureName1')}}{{$t('movieDetail.subPureName2')}}&nbsp;:</span>
           <span class="ellipsis movie-name">{{mDetail.pureName}}</span>
           <span>{{$t('movieDetail.pubDate')}}:&nbsp;</span>
           <time>{{mDetail.pubDate}}</time>
       </div>
       <div class="m-body"  :class="{'wild': $i18n.locale==='en'}">
            <p class="thunder-down">
               <span>{{mDetail.pureName}}</span><span v-if="$i18n.locale === 'en'">&nbsp;</span>{{$t('movieDetail.downLoadAddressAndDrama')}}：
            </p>
            <img  :src="`/common/${mDetail.detailImgSrc}`" :alt="mDetail.pureName" width="600px"  max-height="800px" /> 
            <p v-if="mDetail.transName && mDetail.transName!== ' '">
                <span class="title">◎{{$t('movieDetail.transName1')}}<span v-if="$i18n.locale!=='en'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span v-else>&nbsp;&nbsp;</span>{{$t('movieDetail.transName2')}}</span><span>{{mDetail.transName}}</span>
            </p>
            <p v-if="mDetail.subPureName && mDetail.subPureName!== ' '">
                <span class="title">◎{{$t('movieDetail.subPureName1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.subPureName2')}}</span><span>{{mDetail.subPureName}}</span>
            </p>
            <p v-if="mDetail.year && mDetail.year!==' '">
                <span class="title">◎{{$t('movieDetail.year1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.year2')}}</span><span>{{mDetail.year}}</span>
            </p>
            <p v-if="mDetail.country && mDetail.country!=' '">
                <span class="title">◎{{$t('movieDetail.country1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.country2')}}</span><span>{{mDetail.country}}</span>
            </p>
            <p v-if="mDetail.types && mDetail.types!=' '">
                <span class="title">◎{{$t('movieDetail.type1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.type2')}}</span><span>{{mDetail.types}}</span>
            </p>
            <p v-if="mDetail.language && mDetail.language!=' '">
                <span class="title">◎{{$t('movieDetail.language1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.language2')}}</span><span>{{mDetail.language}}</span>
            </p>
            <p v-if="mDetail.caption && mDetail.caption!=' '">
                <span class="title">◎{{$t('movieDetail.caption1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.caption2')}}</span><span>{{mDetail.caption}}</span>
            </p>
            <p v-if="mDetail.onDate && mDetail.onDate!=' '">
                <span class="title">◎{{$t('movieDetail.onDate')}}</span><span>{{mDetail.onDate}}</span>
            </p>
            <p v-if="mDetail.imdbScore && mDetail.imdbScore!=' '">
                <span class="title">◎{{$t('movieDetail.imdbScore')}}</span><span>{{mDetail.imdbScore}}</span>
            </p>
            <p v-if="mDetail.imdbLink && mDetail.imdbLink!=' '">
                <span class="title">◎{{$t('movieDetail.imdbLink')}}</span><span>{{mDetail.imdbLink}}</span>
            </p>
             <p v-if="mDetail.format && mDetail.format!=' '">
                <span class="title">◎{{$t('movieDetail.formate1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.formate2')}}</span><span>{{mDetail.format}}</span>
            </p>
            <p v-if="mDetail.fileSize && mDetail.fileSize!=' '">
                <span class="title">◎{{$t('movieDetail.filmSize')}}</span><span>{{mDetail.fileSize}}</span>
            </p>
            <p v-if="mDetail.videoSize && mDetail.videoSize!=' '">
                <span class="title">◎{{$t('movieDetail.videoSize')}}</span><span>{{mDetail.videoSize}}</span>
            </p>
            <p v-if="mDetail.filmLength && mDetail.filmLength!=' '">
                <span class="title">◎{{$t('movieDetail.filmLength1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.filmLength2')}}</span><span>{{mDetail.filmLength}}</span>
            </p>
            <p v-if="mDetail.doubanScore && mDetail.doubanScore!=' '">
                <span class="title">◎{{$t('movieDetail.doubanScore')}}</span><span>{{mDetail.doubanScore}}</span>
            </p>
            <p v-if="mDetail.doubanLink && mDetail.doubanLink!=' '">
                <span class="title">◎{{$t('movieDetail.doubanLink')}}</span><span>{{mDetail.doubanLink}}</span>
            </p>
            <p v-if="mDetail.director && mDetail.director!=' '">
                <span class="title">◎{{$t('movieDetail.director1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.director2')}}</span><span>{{mDetail.director}}</span>
            </p>
            <p v-if="mDetail.editor && mDetail.editor!=' '">
                <span class="title">◎{{$t('movieDetail.editor1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.editor2')}}</span><span>{{mDetail.editor}}</span>
            </p>
            <template v-if="mDetail.actor && mDetail.actor!=' '">
                <p>
                    <span class="title">◎{{$t('movieDetail.actor1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.actor2')}}</span><span>{{mDetail.actor[0]}}</span>
                </p>
                <p v-for="(item,idx) of mDetail.actor.slice(1)" :key="`actor${idx}`">
                    <span class="title"></span><span>{{item}}</span>
                </p>
            </template>
            <p class="margin label" v-if="mDetail.label && mDetail.label!=' '">
                <span class="title">◎{{$t('movieDetail.label1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.label2')}}</span><span>{{mDetail.label}}</span>
            </p>
            <template v-if="mDetail.shortIntro && mDetail.shortIntro!=' '">
                <div class="margin">
                    <span class="title" style="width: 68px;">◎{{$t('movieDetail.briefIntro1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.briefIntro2')}}</span>
                </div>
                 <p v-for="(item,idx) of mDetail.shortIntro" :key="`intro${idx}`">
                    <span class="title" style="width: 32px;"></span><span>{{item}}</span>
                </p>
            </template>
            <template v-if="mDetail.getAward && mDetail.getAward!=' '">
                <div class="margin">
                    <span class="title" style="width: 60px;">◎{{$t('movieDetail.getAward1')}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$t('movieDetail.getAward2')}}</span>
                </div>
                 <p v-for="(item,idx) of mDetail.getAward" :key="`award${idx}`">
                    <span class="title" style="width: 32px;"></span><span>{{item}}</span>
                </p>
            </template>
       </div>
       <div class="bot">
           <h3>{{$t('movieDetail.downLoadUrl')}}:</h3>
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
                <span>{{$t('movieDetail.tip')}}:&nbsp;</span>{{$t('movieDetail.downLoadTip')}}<span v-if="$i18n.locale==='en'">&nbsp;</span><router-link to="/downLoadThunder">{{$t('movieDetail.noLimitThunder')}}</router-link>
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
        default: () => ''
    }) private mDetail!: object
}
</script>

<style lang="scss" scoped>
    .m-text {
        overflow: hidden;
        .movie-name {
            display: inline-block;
            vertical-align: middle;
            max-width: 240px;
        }
        h1 {
            padding: 0 20px;
            margin-bottom: 11px;
            line-height: 42px;
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            @include font_color($font-theme1-color);
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
            &.wild {
                .title {
                    width: 120px;
                }
            }
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
            padding: 0 10px 15px;
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
                    @include font_color($font-theme1-color);
                }
            }
            .down-tip {
                color: $font-red-color;
                a:hover{
                    @include font_color($font-theme1-color);
                }
            }
        }
    }
</style>