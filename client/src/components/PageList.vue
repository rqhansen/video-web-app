<template>
    <div class="page-m-list-wp">
        <empty-data v-if="movie && !movie.length"/>
        <ul v-else>
            <li v-for="(m,idx) of movie" :key="idx">
                <div class="poster transition" 
                    :style="`background-image:url(http://www.wx520.net/public/${m.indexImgSrc})`"
                    @click.stop="goMovieDetail(m.type,m.id)">
                </div>
                <div class="txt">
                    <p class="full-name ellipsis transition" @click.stop="goMovieDetail(m.type,m.id)"><span>{{m.pureName}}</span>{{m.sharpness}}</p>
                    <div class="intro-wp">
                        <p class="ellipsis"><span class="title">@{{$t('pageList.year1')}}&nbsp;&nbsp;{{$t('pageList.year2')}}</span>{{m.year}}({{m.country}})</p>
                        <p class="ellipsis"><span class="title">@{{$t('pageList.actor1')}}&nbsp;&nbsp;{{$t('pageList.actor2')}}</span>{{m.actor[0]}}</p>
                        <p class="intro title ellispis"><span class="title">@{{$t('pageList.briefIntroduce1')}}&nbsp;&nbsp;{{$t("pageList.briefIntroduce2")}}</span>{{m.shortIntro}}</p>
                        <p class="update ellipsis" :class="{'new': m.isNew}">
                            {{$t('pageList.updateTime')}}&nbsp;:
                            <template v-if="!m.isNew">
                                <time>{{m.pubDate}}</time>
                                <span class="transition">{{$t('pageList.clickToDownLoad')}}</span>
                            </template>
                            <template v-else>
                                <time>{{m.pubDate}}({{$t('pageList.todayRecomment')}})</time>
                                <span class="transition">{{$t('pageList.clickToDownLoad')}}</span>
                            </template>
                        </p>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</template>

<script lang="ts">
    import { Component, Prop, Vue } from 'vue-property-decorator';
    import EmptyData from './EmptyData.vue';
    @Component({
        name: 'pageList',
        components: {
            EmptyData
        }
    })

    export default class extends Vue {
        @Prop({
            required: true,
            default: () => []
        }) private movie!: object

        //去电影详情
        goMovieDetail(enName: string,id: string) {
            this.$router.push(`/${enName}/${id}`);
        }
    }
</script>

<style lang="scss" scoped>
    .page-m-list-wp {
        width: 100%;
        height: 100%;
        min-height: 638px;
        ul {
            width: 100%;
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            li {
                flex: 0 0 50%;
                max-width: 50%;
                display: flex;
                justify-content: flex-start;
                padding: 0 10px 0 0;
                margin-bottom: 24px;
                p:not(.intro) {
                    width: 100%;
                }
                .poster {
                    width: 140px;
                    height: 174px;
                    padding: 2px;
                    margin-right: 10px;
                    border: 1px solid $font-border-color;
                    background-size: cover;
                    background-clip: content-box;
                    cursor: pointer;
                    &:hover {
                        @include br_color($font-theme1-color);
                    }
                }
                .txt {
                    position: relative;
                    width: calc(100% - 150px);
                    overflow: hidden;
                    .title {
                        margin-right: 6px;
                    }
                    .full-name {
                        display: inline-block;
                        font-size: 16px;
                        margin-bottom: 5px;
                        line-height: 30px;
                        @include font_color($font-theme1-color);
                        font-weight: bold;
                        cursor: pointer;
                        &:hover {
                            color: $font-red-color;
                        }
                        span {
                            color: $font-red-color;
                        }
                    }
                    .intro-wp {
                        width: 100%;
                        font-size: 12px;
                        line-height: 22px;
                        word-break: break-all;
                    }
                    .intro {
                        display:flex;
                        display: -webkit-box;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: pre-line;
                        -webkit-line-clamp: 3;
                        -webkit-box-orient: vertical;
                    }
                    .update {
                        position: absolute;
                        left: 0;
                        bottom: 0;
                        @include font_color($font-theme1-color);
                        line-height: 30px;
                        &.new {
                            time {
                                color: $font-red-color;
                            }
                        }
                        time {
                            margin: 0 8px;
                        }
                        span {
                            cursor: pointer;
                            &:hover {
                                color: $font-red-color;
                            }
                        }
                    }
                }
            }
        }
    }
</style>