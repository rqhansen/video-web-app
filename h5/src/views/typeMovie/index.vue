<template>
<page-wrap>
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
    <!-- 回顶部 -->
    <back-top target=".scroll-wrap"/>
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
            movieType: ''
        }
    },
    methods: {
        async getTypeMovie(page) {
            const { params: { id } } = this.$route;
            const {data: {code,data: {total,typeMovie}}}  = await getTypeMovie({
                page: page,
                type: id
            });
            if(code !== 0) return;
            this.movies = typeMovie;
            this.typeCnName = typeMovie[0].typeName; 
            this.totalPage = total;
            this.currPage = page;
            this.movieType = id;
        }
    },
    created() {
        this.getTypeMovie(1);
    }
}
</script>

<style lang="scss" scoped>
.type-m-wp {
    .m-pic-list {
        li {
            margin-bottom: 48px;
        }
    }
}

</style>