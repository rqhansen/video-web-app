<template>
    <page-wrap class="search-page-box">
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

        </div>
        <div slot="bottom">
            <pagination :total="total" :currPage="currPage" @get-page-data="search"/>
            <Footer/>
        </div>
        <!-- 回顶部 -->
    </page-wrap>
</template>

<script>
import SingleMovie from '@/views/common/singleMovie';
import { search } from '@/apis/search';
 export default {
    name: 'Search',
    components: { SingleMovie },
    data() {
        return {
            movies: [],
            total: 0,
            movieName: '',
            currPage:'',
            keyWord: ''
        }
    },
    methods: {
        search(page) {
            if(!this.keyWord) return;
            if(this.currPage === page) return;
            this.$router.push(`/search?keyword=${this.keyWord}&page=${page}`);
        },
       async getData() {
            const { query: { keyword,page } } = this.$route;
            const { data: { code, data: { keyword: movieName,movies,total } } } = await search({keyword,page});
            this.movies = movies;
            this.total = total;
            this.movieName = movieName;
            this.currPage = page * 1;
            this.keyWord = keyword;
        }
    },
    created() {
        this.getData();
    }
 }
</script>

<style lang="scss" scoped>
.search-page-box {
    /deep/ .m-content {
        min-height: calc(100% - 298px);
    }
}
.search-wp {
    .m-result{
        color: #be1204;
    }
    .m-pic-list {
        overflow: hidden;
        li {
            width: 100%;
            &:not(:last-child) {
                margin-bottom: 48px;
            }
        }
    }
}
.pagination-bar {
    width: 96%;
    margin: 0 auto 20px;
}
</style>