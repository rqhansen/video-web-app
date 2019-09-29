<template>
    <div class="search-wp min-width">
        <div class="section search">
            <nav-bg>
                <div class="search-title"><span>{{movieName}}</span>搜素结果</div>
            </nav-bg>
            <page-list 
                :movie="movies"/>
            <pagination 
                :totalPage="total"
                :currentPage="currPage"
                @get-curr-page-data="getSearchPageData"/>
        </div>
    </div>
</template>

<script lang="ts">
import {Component,Watch,Vue} from 'vue-property-decorator';
import {Route} from 'vue-router';
import {SearchModule} from '@/store/modules/search';
import {search} from '@/apis/search';
import NavBg from '@/components/NavBg.vue';
import PageList from '@/components/PageList.vue';
import Pagination from '@/components/Page.vue';

@Component({
    name: 'search',
    components: {
        NavBg,
        PageList,
        Pagination
    }
})
export default class extends Vue {
    private movies = [];
    private movieName = '';
    private total = 0;
    private currPage = 1;

    @Watch('$route')
    private handleOnRouteChange(nRoute: Route) {
        this.onSearch(nRoute);
    }

    get preSearchPage() {
        return SearchModule.searchInfo.page;
    }

    get preSearchName() {
        return SearchModule.searchInfo.movieName;
    }

    created() {
        this.onSearch(this.$route);
    }

    private async onSearch(nRoute: Route) {
        const shouldSearch = this.isShouldSearch(nRoute);
        if(!shouldSearch) return;
        const { name , query: { keyword,page } } = this.$route;
        const { data: { code, data: { keyword: movieName,movies,total } } } = await search({keyword,page});
        this.movies = movies;
        this.movieName = movieName;
        this.total = total;
        this.currPage = +page;
        SearchModule.changeSearchInfo({
            page: `${page}`,
            movieName: movieName
        });
    }

    //点击页数
    private async getSearchPageData(page: number) {
        this.$router.push(`/search?keyword=${this.movieName}&page=${page}`)
    }

    //判断是否应该执行搜索
    private isShouldSearch(route: Route) {
        let flag = true;
        const { name, query ,query: { page, keyword } } = route;
        if(name !== 'search') { //离开当前页面
            flag = false;
        }
        if(!page || !keyword) { // 手动修改当前路由
            flag = false;
        }
        if( this.preSearchPage === page && this.preSearchName === keyword) {//回退到当前页
            flag = false;
        }
        return flag;
    }
}
</script>

<style lang="scss" scoped>
.search-wp {
    .search {
        padding: 25px 0;
        .search-title {
            span {
                color: $font-red-color;
            }
        }
    }
}
</style>