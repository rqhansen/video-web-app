<template>
    <page-wrap>
        <div slot="main" class="search-wp">
            <curr-bg  class="curr-wp">
                <div slot="currWp">
                    <span class="m-result">{{movieName}}</span>搜索结果
                </div>
            </curr-bg>
            <section class="m-pic-list">
                <ul>
                    <li v-for="(item,idx) of movies" :key="`${item.id}${idx}`">
                        <single-movie :movie="item"/>
                    </li>
                </ul>
            </section>
            <pagination :total="total"/>
        </div>
        <Footer slot="bottom"/>
    </page-wrap>
</template>

<script>
import PageWrap from '@/views/common/pageWrap.vue';
import CurrBg from '@/views/common/current';
import Pagination from '@/views/common/pagination';
import SingleMovie from '@/views/common/singleMovie';
import Footer from '@/views/common/footer';
import { search } from '@/apis/search';
 export default {
    name: 'Search',
    components: { CurrBg,PageWrap,SingleMovie,Pagination,Footer },
    data() {
        return {
            movies: [],
            total: 0,
            movieName: ''
        }
    },
    methods: {
       async search() {
            const { query: { keyword, page } } = this.$route;
            const { data: { code, data: { keyword: movieName,movies,total } } } = await search({keyword,page});
            this.movies = movies;
            this.total = total;
            this.movieName = movieName;
        }
    },
    created() {
        this.search();
    }
 }
</script>

<style lang="scss" scoped>
.search-wp {
    .m-result{
        color: #be1204;
    }
    .m-pic-list {
        overflow: hidden;
            li {
            width: 100%;
            margin-bottom: 48px;
        }
    }
    .pagination-bar {
        margin-top: 48px;
    }
}
</style>