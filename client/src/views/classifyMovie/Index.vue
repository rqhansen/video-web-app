<template>
    <div class="classify-m-wp limit-width">
        <div class="section classify-m">
            <nav-bg>
                    <crumbs v-if="movie.length" 
                    :typeEnName="movieType"
                    :typeZhName="movie[0].typeName"
                    @get-index-page-data="getIndexPageData"/>
            </nav-bg>
            <page-list 
                :movie="movie"
            />
            <pagination 
                :totalPage="totalPage"
                :currentPage="currPage"
                @get-curr-page-data="getCurPageData"/>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Watch, Vue } from 'vue-property-decorator';
import {Route} from 'vue-router';
import {getTypeMovie} from '@/apis/typeMovie';
import {Page} from '@/interface/page';
import Crumbs from '@/components/Crumbs.vue';
import PageList from '@/components/PageList.vue';
import Pagination from '@/components/Page.vue';
import NavBg from '@/components/NavBg.vue';
@Component({
    name: 'classifyMovie',
    components: {
        NavBg,
        Crumbs,
        PageList,
        Pagination
    }
})
export default class extends Vue {
    private movie = [];
    private totalPage = 0;
    private movieType = '';
    private currPage = 1;

    @Watch('$route')
    private handleRouteChange(to: Route,from: Route) {
        const { path: fromPath } = from;
        const { path: toPath, params: toParams, name: toName } = to;
        if(toName === 'classifyMovie' ) { //跳到分类电影才开始请求
            if(this.movieType === toParams.id) {
                return;
            }
            const {id} = toParams;
            this.getCurMovie({
                    page: 1,
                    type: id
                });
        }
    }
    created() {
        const {params: {id}} = this.$route;
        this.getCurMovie({
            page: 1,
            type: id
        });
    }

    //分页事件
    private async getCurPageData(page: number) {
        this.getCurMovie({
            page: page,
            type: this.movieType
        })
    }

    //获取当前页数据
    private async getCurMovie(params: Page) {
        const {data: {code,data: {total,typeMovie}}} = await getTypeMovie(params);
        if(code !== 0) return;
        this.movie = typeMovie;
        this.totalPage = total;
        this.currPage = params.page;
        this.movieType = params.type;
    }

    //获取首页数据
    private async getIndexPageData() {
        if(this.currPage === 1) return;
        this.getCurMovie({
            page: 1,
            type: this.movieType
        })
    }
    
}
</script>

<style lang="scss" scoped>
.classify-m-wp {
    .classify-m {
        padding-top: 30px;
    }
}   
@media (max-width: 768px){
        .section {
            ul {
                li {
                    flex: 0 0 100%;
                    max-width: 100%;
                }
            }
        }
}
</style>