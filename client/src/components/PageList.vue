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
                        <p class="ellipsis"><span class="title">@年&nbsp;&nbsp;代</span>{{m.year}}({{m.country}})</p>
                        <p class="ellipsis"><span class="title">@主&nbsp;&nbsp;演</span>{{m.actor[0]}}</p>
                        <p class="intro title ellispis"><span class="title">@简&nbsp;&nbsp;介</span>{{m.shortIntro}}</p>
                        <p class="update ellipsis" :class="{'new': m.isNew}">
                            更新时间&nbsp;:
                            <template v-if="!m.isNew">
                                <time>{{m.pubDate}}</time>
                                <span class="transition">点击下载</span>
                            </template>
                            <template v-else>
                                <time>{{m.pubDate}}(今日推荐)</time>
                                <span class="transition">点击下载</span>
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
                    padding: 1px;
                    margin-right: 10px;
                    border: 1px solid transparent;
                    background-size: cover;
                    background-clip: content-box;
                    cursor: pointer;
                    &:hover {
                        border-color: $font-red-color;
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
                        color: $font-blue-color;
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
                        color: #106492;
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
                                color: $font-theme-color;
                            }
                        }
                    }
                }
            }
        }
    }
</style>