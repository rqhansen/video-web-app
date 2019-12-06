<template>
    <page-wrap>
        <div slot="main" class="search-wp">
            <curr-bg  class="curr-wp">
                <template slot="currWp">
                    <span class="m-result">{{movieName}}</span>搜索结果
                </template>
            </curr-bg>
            <section class="m-pic-list">
                <ul>
                    <li v-for="item of movies" :key="item.id">
                        <single-movie :movie="item"/>
                    </li>
                </ul>
            </section>
        </div>
    </page-wrap>
</template>

<script>
import PageWrap from '@/views/common/pageWrap.vue';
import CurrBg from '@/views/common/current'
import SingleMovie from '@/views/common/singleMovie';
import { search } from '@/apis/search';
 export default {
    name: 'Search',
    components: { CurrBg,PageWrap,SingleMovie },
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
    .curr-wp {
        border: 1px solid #bfe4ff;
        margin-bottom: 40px;
    }
    .m-result{
        color: #be1204;
    }
    .m-pic-list {
        overflow: hidden;
        >ul {
            width: 100%;
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            li {
                width: 100%;
                margin-bottom: 48px;
            }
        }
    }
}
</style>