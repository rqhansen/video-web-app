<template>
    <page-wrap>
        <div slot="main" class="search-wp">
            <curr-bg>
                <template slot="currWp">
                    <span class="s-movie">{{movieName}}</span>搜索结果
                </template>
            </curr-bg>
        </div>
    </page-wrap>
</template>

<script>
import PageWrap from '@/views/common/pageWrap.vue';
import CurrBg from '@/views/common/current'
import { search } from '@/apis/search';
 export default {
    name: 'Search',
    components: { CurrBg,PageWrap },
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
    }
    .s-movie {
        color: #be1204;
    }
}
</style>