<template>
    <div class="movie-list">
        <ul>
            <li v-for="m of movies" :key="m.pureName">
                <div class="poster">
                    <img :src="`http://www.wx520.net/public/${m.indexImgSrc}`" :alt="m.fullName">
                </div>
                <div class="txt">
                    <h3 class="ellipsis">{{m.fullName}}</h3>
                    <time>{{m.pubDate}}</time>
                </div>
            </li>
        </ul>
    </div>
</template>

<script lang="ts">
import {Component,Vue} from 'vue-property-decorator';
import {getIndexMovieList} from '@/apis/home';

@Component({
    name: 'movieList'
})

export default class extends Vue {
    private movies = [];
    private async getMovieList() {
        const { data: { code, data: { movies } } } = await getIndexMovieList();
        console.log(movies);
        this.movies = movies;
    }
    async created() {
        this.getMovieList();
    }
}
</script>

<style lang="scss" scoped>
    .movie-list {
        width: 100%;
        min-width: 768px;
        ul {
            width: 100%;
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            li {
                // flex: 0 0 16.66667%;
                padding: 0 15px;
                margin-bottom: 15px;
                font-size: 0;
                text-align: center;
                cursor: pointer;
                overflow: hidden;
                .poster {
                    position: relative;
                    height: 0;
                    padding-top: 121.5%;
                    overflow: hidden;
                    img {
                        position: absolute;
                        left: 0;
                        top: 0;
                        width: 100%;
                        height: 100%;
                        padding: 1px;
                        border: 1px solid transparent;
                        &:hover {
                            border-color: #FF0000;
                        }
                    }
                }
                .txt {
                    margin-top: 2px;
                    h3 {
                        line-height: 24px;
                        font-size: 13px;
                        color: #FF0000;
                    }
                    time {
                        line-height: 16px;
                        font-size: 12px;
                        color: #FF0000;
                    }
                }
            }
        }
    }
    @media (min-width: 768px) {
        .movie-list {
            li {
                flex: 0 0 25%;
                max-width: 25%;
            }
        } 
    }
    @media (min-width: 992px) {
        .movie-list {
            li {
                flex: 0 0 16.66667%;
                max-width: 16.66667%;
            }
        } 
    }

    @media (max-width: 992px) {
        .movie-list {
            ul {
                li {
                    padding: 0 10px;
                }
            }
        } 
    }
</style>

