<template>
    <div class="movie-list">
        <ul>
            <li v-for="m of movies" :key="m.pureName">
                <div class="poster">
                    <img class="transition" :src="`http://www.wx520.net/public/${m.indexImgSrc}`" :alt="m.fullName">
                </div>
                <div class="txt" :class="{'new': m.isNew}">
                    <h3 class="ellipsis">{{m.fullName}}</h3>
                    <time>{{m.pubDate}}</time>
                </div>
            </li>
        </ul>
    </div>
</template>

<script lang="ts">
import {Component,Prop,Vue} from 'vue-property-decorator';

@Component({
    name: 'movieList'
})

export default class extends Vue {
    @Prop({default: () => []}) private movies!: []
    // private movies = [];
    // private async getMovieList() {
    //     // const { data: { code, data: { movies } } } = await getIndexMovieList();
    //     // console.log(movies);
    //     // this.movies = movies;
    // }
    async created() {
        // this.getMovieList();
    }
}
</script>

<style lang="scss" scoped>
    .movie-list {
        width: 100%;
        padding-top: 10px;
        ul {
            min-width: 716px;
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            li {
                flex: 0 0 16.666667%;
                max-width: 16.666667%;
                padding: 0 20px;
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
                            border-color: $font-red-color;
                        }
                    }
                }
                .txt {
                    margin-top: 2px;
                    &.new {
                        time {
                            color: $font-red-color;
                        }
                    }
                    h3 {
                        line-height: 24px;
                        font-size: 13px;
                        color: $font-red-color;
                    }
                    time {
                        line-height: 16px;
                        font-size: 12px;
                        color: $font-regular-color;
                    }
                }
            }
        }
    }
    @media (max-width: 992px) {
        .movie-list {
            ul {
                li {
                    flex: 0 0 25%;
                    max-width: 25%;
                    padding: 0 15px;
                }
            }
        } 
    }
    
</style>

