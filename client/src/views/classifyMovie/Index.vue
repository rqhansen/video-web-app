<template>
    <div class="classify-m-wp">
        <div class="section classify-m">
            <div class="header">
                <crumbs v-if="movie.length" 
                                    :typeEnName="movieType"
                                    :typeZhName="movie[0].typeName"
                                    @get-index-page-data="getIndexPageData"/>
            </div>
            <page-list 
                :movie="movie"
                :totalPage="totalPage"
                :typeEnName="movieType"
                :page-size="14"
                :currentPage="currPage"
                @get-curr-page-data="getCurPageData"
                />
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Watch, Vue } from 'vue-property-decorator';
import {Route} from 'vue-router';
import {getTypeMovie} from '@/apis/typeMovie';
import {Page} from '@/interface/page';
import crumbs from '@/components/Crumbs.vue';
import PageList from './components/PageList.vue';
@Component({
    name: 'classifyMovie',
    components: {
        crumbs,
        PageList
    }
})
export default class extends Vue {
    private movie = [];
    private totalPage = 0;
    private movieType = '';
    private currPage = 1;

    @Watch('$route')
    private handleRouteChange(to: Route,from: Route) {
        const fromPath = from.path;
        const toPath = to.path;
        const params = to.params;
        const name = to.name;
        if(name === 'classifyMovie' && params.id) { //跳到分类电影才开始请求
            let flag = fromPath.includes('/movie/*') && toPath.includes('/movie/*');
            let flag2 = this.movieType !== params.id;
            if(flag || ( !fromPath.includes('/movie/*') && flag2 )) {
                const id = params.id;
                this.getCurMovie({
                    page: 1,
                    type: id
                });
            }
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
        const {data: {code,data: {total,movieType,typeMovie}}} = await getTypeMovie(params);
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
        .header{
            margin-bottom: 20px;
            border: 1px solid #bfe4ff;
            background-color: #f7f7ff;
        }
    }
}   
</style>