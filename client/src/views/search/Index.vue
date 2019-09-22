<template>
    <div class="search-wp limit-width">
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
export default class extends Vue{
    private movies = [];
    private movieName = '';
    private total = 0;
    private currPage = 1;
    @Watch('$route')
    private handleOnRouteChange(n: Route) {
        this.onSearch();
    }
    created() {
        this.onSearch();
    }

    private async onSearch() {
        const { query: {keyword,page} } = this.$route;
        const { data: { code, data: { keyword: movieName,movies,total } } } = await search({keyword,page});
        this.movies = movies;
        this.movieName = movieName;
        this.total = total;
        // this.currPage = page;
    }

    //分页事件
    private async getSearchPageData(page: number) {
        this.$router.push(`/search?keyword=${this.movieName}&page=${page}`);
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