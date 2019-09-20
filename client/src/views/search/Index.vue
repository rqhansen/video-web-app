<template>
    <div class="search-wp">
        <div class="section">
            <s-header :movieName="movieName"/>
            <!-- <page-list 
                :movie="movies"
                /> -->
        </div>
    </div>
</template>

<script lang="ts">
import {Component,Vue} from 'vue-property-decorator';
import {Route} from 'vue-router';
import {search} from '@/apis/search';
import sHeader from './components/header.vue';

@Component({
    name: 'search',
    components: {
        sHeader
    }
})
export default class extends Vue{
    private movies = [];
    private movieName = '';
    private total = 0;
    created() {
        this.onSearch();
    }

    private async onSearch() {
        const { query: {keyword,page} } = this.$route;
        const { data: { code, data: { keyword: movieName,movies,total } } } = await search({keyword,page});
        this.movies = movies;
        this.movieName = movieName;
        this.total = total;
    }
}
</script>

<style lang="scss" scoped>
.search-wp {
    .section {
        padding: 25px 0;
    }
}
</style>