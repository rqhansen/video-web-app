<template>
<div class="m-list-pic">
    <div class="pic">
        <!-- <a :title="movie.pureName"> -->
            <img :src="`http://www.wx520.net/public/${movie.indexImgSrc}`" alt="movie.pureName" width="auto" height="auto">
        <!-- </a> -->
    </div>
    <div class="m-intro-box">
        <p class="m-name ellipsis transition" @click.stop="goMovieDetail(movie.type,movie.id)"><span>{{movie.pureName}}</span><b>{{movie.sharpness}}</b></p>
        <div class="m-intro">
            <p class="ellipsis">@年&nbsp;&nbsp;代<span class="gap">{{movie.year}}({{movie.country}})</span></p>
            <p class="ellipsis">@主&nbsp;&nbsp;演<span class="gap">{{movie.actor[0]}}</span></p>
            <p class="intro title ellispis">@简&nbsp;&nbsp;介<span class="gap">{{movie.shortIntro}}</span></p>
            <p class="update ellipsis">
                更新时间&nbsp;:
                <time v-if="!movie.isNew">{{movie.pubDate}}</time>
                <time v-else class="new">{{movie.pubDate}}(今日推荐)</time>
                <span class="transition click-down">点击下载</span>
            </p>
        </div>
    </div>
</div>
</template>

<script>
export default {
    name: 'SingleMovie',
    props: {
        movie: {required: true}
    },
    methods: {
        goMovieDetail() {

        }
    }
}
</script>

<style lang="scss" scoped>
.m-list-pic {
    width: 100%;
    display: flex;
    justify-content: flex-start;
    .pic {
        width: 280px;
        height: 348px;
        margin-right: 20px;
        overflow: hidden;
        > img {
            width: 100%;
            height: 100%;
        }
    }
    .m-intro-box {
        position: relative;
        width: calc(100% - 280px);
        overflow: hidden;
        .m-name {
            margin-bottom: 10px;
            font-size: 32px;
            line-height: 60px;
            color: #106492;
            >span {
                font-weight: bolder;
                color: #be1204;
            }
        }
        .m-intro {
            font-size: 24px;
            line-height: 44px;
            >p:not(.intro) {
                width: 100%;
            }
            .intro {
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 3;
                overflow: hidden;
            }
            .gap {
                margin-left: 10px;
            }
            .update {
                position: absolute;
                left: -2px;
                bottom: 0;
                color: #0067b0;
                line-height: 60px;
            }
            .new {
                color: #be1204;
            }
            .click-down {
                margin-left: 12px;
            }
        }
    }
}
</style>