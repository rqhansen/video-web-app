<template>
    <div class="page-m-list-wp">
        <empty-data v-if="movie && !movie.length"/>
        <ul v-else>
            <li v-for="(m,idx) of movie" :key="idx">
                <div class="item-poster transition" @click.stop="goMovieDetail(m.type,m.id)">
                    <Poster :src="m.indexImgSrc" :mName="m.pureName"/>
                </div>
                <div class="txt">
                    <p class="full-name ellipsis transition" @click.stop="goMovieDetail(m.type,m.id)"><span>{{m.pureName}}</span>{{m.sharpness}}</p>
                    <div class="intro-wp">
                        <p class="ellipsis"><span class="title">@{{$t('pageList.year1')}}&nbsp;&nbsp;{{$t('pageList.year2')}}</span>{{m.year}}({{m.country}})</p>
                        <p class="ellipsis"><span class="title">@{{$t('pageList.actor1')}}&nbsp;&nbsp;{{$t('pageList.actor2')}}</span>{{m.actor[0]}}</p>
                        <p class="intro title ellispis"><span class="title">@{{$t('pageList.briefIntroduce1')}}&nbsp;&nbsp;{{$t("pageList.briefIntroduce2")}}</span>{{m.shortIntro}}</p>
                        <p class="update" :class="{'new': m.isNew}">
                            {{$t('pageList.updateTime')}}&nbsp;:
                            <time v-if="!m.isNew">{{m.pubDate}}</time>
                            <time v-else>{{m.pubDate}}({{$t('pageList.todayRecomment')}})</time>
                            <span class="transition" @click="goMovieDetail(m.type,m.id)">{{$t('pageList.downLoad')}}</span>
                        </p>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</template>

<script lang="ts">
    import { Component, Prop, Vue } from 'vue-property-decorator';
    import Poster from './poster.vue';
    import EmptyData from './EmptyData.vue';
    @Component({
        name: 'pageList',
        components: {
            Poster,
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
        min-height: calc(100vh - 404px);
        ul {
            li {
                display: inline-block;
                width: 50%;
                height: 174px;
                max-width: 50%;
                padding: 0 10px 0 0;
                margin-bottom: 24px;
                p:not(.intro) {
                    width: 100%;
                }
                .item-poster {
                    width: 140px;
                    float: left;
                    padding: 2px;
                    border: 1px solid $font-border-color;
                    cursor: pointer;
                    &:hover {
                        @include br_color($font-theme1-color);
                    }
                }
                .txt {
                    position: relative;
                    float: right;
                    height: 100%;
                    width: calc(100% - 150px);
                    overflow: hidden;
                    .title {
                        margin-right: 6px;
                    }
                    .full-name {
                        display: inline-block;
                        font-size: 16px;
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
                        line-height: 21px;
                        word-break: break-all;
                    }
                    .intro {
                        position: relative;
                        width: 100%;
                        height: 66px;
                        overflow: hidden;
                    }
                    .update {
                        position: absolute;
                        left: 0;
                        bottom: 6px;
                        @include font_color($font-theme1-color);
                        line-height: 16px;
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