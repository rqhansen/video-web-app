<template>
<page-wrap class="type-movie-box">
    <div slot="main" class="type-m-wp">
        <curr-bg class="curr-wp">
            <div slot="currWp">
                <span>当前位置：</span>
                <router-link to="/">万寻电影</router-link>>
                <router-link :to="`/movie/${movieType}`">{{typeCnName}}</router-link>
                <span>>>迅雷下载页面</span>
            </div>
        </curr-bg>
        <section class="m-pic-list">
            <ul >
                <li v-for="(item,idx) of movies" :key="`${item.id}${idx}`">
                    <single-movie :movie="item"/>
                </li>
            </ul>
        </section>
      
        </div>
        <div slot="bottom">
            <pagination :total="totalPage" :currPage="currPage" @get-page-data="getTypeMovie"/>
            <Footer/>
        </div>
</page-wrap>
</template>

<script>
import SingleMovie from '@/views/common/singleMovie';
import { getTypeMovie } from '@/apis/typeMovie.js';
export default {
    name: 'typeMovie',
    components: { SingleMovie },
    data() {
        return {
            movies: [],
            typeCnName: '',
            totalPage: 0,
            movieType: '',
            currPage: ''
        }
    },
    methods: {
        async getTypeMovie(page) {
            if(this.currPage === page) return;
            const { params: { id } } = this.$route;
            const {data: {code,data: {total,typeMovie}}}  = await getTypeMovie({
                page: page,
                type: id
            });
            if(code !== 0) return;
            this.movies = typeMovie;
            this.typeCnName = typeMovie[0].typeName; 
            this.totalPage = total;
            this.currPage = page * 1;
            this.movieType = id;
        }
    },
    created() {
        this.getTypeMovie(1);
    }
}
</script>

<style lang="scss" scoped>
.type-movie-box {
    /deep/ .m-content {
        min-height: calc(100% - 298px);
    }
    .m-content {
        height: calc(100% - 318px);
    }
}
.type-m-wp {
    .m-pic-list {
        li {
            margin-bottom: 48px;
        }
    }
}
.pagination-bar {
    width: 96%;
    margin: 0 auto 20px;
}

</style>