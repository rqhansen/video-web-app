<template>
    <div class="m-detail-wp">
        <div class="section">
            <div class="m-detail">
                <div class="header">
                    <crumbs 
                        v-if="mDetail.typeName"
                        :typeEnName="mDetail.filmType"
                        :typeZhName="mDetail.typeName"
                        :movieName="mDetail.pureName"
                        @get-index-page-data="getIndexPageData"/>
                    <div class="share">
                        <span>分享本影片给朋友=》</span>
                        <el-button size="small" type="primary" @click="copy">点次即可复制</el-button>
                    </div>
                </div>
                <detail :mDetail="mDetail"/>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import {Component, Vue} from 'vue-property-decorator';
import { Route } from 'vue-router';
import {movieDetail as movieDetailInterface} from '@/interface/movieDetail';
import {copyText} from '@/utils/utils';
import {getMovieDetail} from '@/apis/movieDetail';
import Crumbs from '@/components/Crumbs.vue';
import detail from './components/detail.vue';

@Component({
    name: 'movieDetail',
    components: {
        Crumbs,
        detail
    }
})

export default class extends Vue{
    private mDetail:movieDetailInterface = {filmType:''}
    created() {
        this.getMovieDetail()
    }

    private async getMovieDetail () {
        const { movie_type,id } = this.$route.params;
        const { data : { code, data:  { movieDetail } } } = await getMovieDetail({
            movieType: movie_type,
            id: id
        });
        this.mDetail = movieDetail;
    }

    private getIndexPageData() {
        this.$router.push(`/movie/${this.mDetail.filmType}`);
    }

    copy() {
       const url = window.location.href;
       const flag = copyText(url);
        if (flag) {
            this.$message({
                message: '网址已复制，可以分享给好友了!',
                center: true,
                type: 'success',
                showClose: true
            });
        }
        // debugger;
    }
}
</script>

<style lang="scss" scoped>
.m-detail-wp {
    .section {
        padding: 25px 0;
        .divide {
            height: 30px;
        }
        .m-detail {
            border: 1px solid $font-theme-color;
            .header{
                display: flex;
                align-items: center;
                background-color: #f7f7f7;
                .el-button--small {
                    width: 92px;
                    height: 20px;
                    padding: 0;
                    line-height: 20px;
                    font-size: 13px;
                }
                .share {
                    margin-left: 30px;
                    span {
                        color: $font-red-color;
                    }
                }
            }
        }
    }
}
</style>