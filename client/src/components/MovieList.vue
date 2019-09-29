<template>
    <div class="movie-list">
        <ul v-if="currentMovie.length">
            <li v-for="m of currentMovie" :key="m.pureName" @click.stop="goMovieDetail(m.filmType,m.id)">
                <div class="poster">
                    <a :title="m.pureName">
                        <img class="transition" :src="`http://www.wx520.net/public/${m.indexImgSrc}`" :alt="m.fullName">
                    </a>
                </div>
                <div class="txt" :class="{'new': m.isNew}">
                    <h3 class="ellipsis">{{m.fullName}}</h3>
                    <time>{{m.pubDate}}</time>
                </div>
            </li>
        </ul>
        <empty-data  v-else-if="currentMovie && !currentMovie.length"/>
    </div>
</template>

<script lang="ts">
import {Component,Prop,Vue} from 'vue-property-decorator';
import EmptyData from './EmptyData.vue';


@Component({
    name: 'movieList',
    components: {
        EmptyData
    }
})

export default class extends Vue {
    
    @Prop({
        default: () => {
            return () => {}
        }
    }) private handleMovieFun!: Function

    @Prop({
        default: () => []
    }) private fetchMovie!: () => []

    get currentMovie() {
        return this.fetchMovie.length ? this.fetchMovie : this.movies
    }

    private movies = '';

    async created() {
        if(!this.fetchMovie.length) { //排除掉
            this.getMovieList();
        }
    }

    private async getMovieList() {
        const { data : { code, data: { movies } } } = await this.handleMovieFun();
        this.movies = movies;
    }

    private goMovieDetail(mType: string, mId: number) {
        this.$router.push(`/${mType}/${mId}`);
    }

}
</script>

<style lang="scss" scoped>
    .movie-list {
        width: 100%;
        padding-top: 10px;
        ul {
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            li {
                flex: 0 0 16.666667%;
                max-width: 16.666667%;
                padding: 0 20px;
                margin-bottom: 10px;
                font-size: 0;
                text-align: center;
                cursor: pointer;
                overflow: hidden;
                .poster {
                    position: relative;
                    height: 0;
                    padding-top: 121.5%;
                    margin-bottom: 3px;
                    overflow: hidden;
                    img {
                        position: absolute;
                        left: 0;
                        top: 0;
                        width: 100%;
                        height: 100%;
                        padding: 2px;
                        border: 1px solid $font-border-color;
                        &:hover {
                            border-color: $font-red-color;
                        }
                    }
                }
                .txt {
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

