<template>
    <div class="m-detail-wp min-width">
        <div class="section">
            <div class="m-detail">
                <nav-bg>
                    <crumbs 
                        v-if="mDetail.typeName"
                        :typeEnName="mDetail.filmType"
                        :typeZhName="mDetail.typeName"
                        :movieName="mDetail.pureName"
                        @get-index-page-data="getIndexPageData"></crumbs>
                    <div class="share">
                        <span>{{$t('titleBar.shareMovie')}}=》</span>
                        <el-button size="small" type="primary" @click="copy">{{$t('titleBar.copy')}}</el-button>
                    </div>
                </nav-bg>
                <detail :mDetail="mDetail"/>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Watch, Vue } from 'vue-property-decorator';
import { Route } from 'vue-router';
import {copyText} from '@/utils/utils';
import {getMovieDetail} from '@/apis/movieDetail';
import NavBg from '@/components/NavBg.vue';
import Crumbs from '@/components/Crumbs.vue';
import detail from './components/detail.vue';

@Component({
    name: 'movieDetail',
    components: {
        Crumbs,
        detail,
        NavBg
    }
})

export default class extends Vue{
    private mDetail = {filmType: ''};
    private movieType = '';
    private movieId = '';

    @Watch('$route')
    private handleRouteChange(to: Route,from: Route) {
        const {name,params } = to;
        if(name === 'movieDetail') {
            const {movie_type,id} = params;
            if(movie_type === this.movieType && id === this.movieId) {
                return;
            }
            this.getMovieDetail();
        }
    }
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
        this.movieType = movie_type;
        this.movieId = id;
    }

    private getIndexPageData() {
        this.$router.push(`/movie/${this.mDetail.filmType}`);
    }

    //复制网址
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
            border: 1px solid red;
            @include br_color($font-theme1-color);
            /deep/ .nav-bg {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                border-top: none;
                border-left: none;
                border-right: none;
            }
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
</style>