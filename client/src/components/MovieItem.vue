<template>
    <div class="movie-item-wp">
        <div class="poster">
            <a :title="movie.pureName">
                <img class="transition" :src="`http://www.wx520.net/public/${movie.indexImgSrc}`" :alt="movie.fullName">
            </a>
        </div>
        <div class="txt" :class="{'new': movie.isNew}">
            <h3 class="ellipsis transition">{{movie.fullName}}</h3>
            <time>{{movie.pubDate}}</time>
        </div>
    </div>  
</template>

<script lang="ts">
import { Component , Prop, Vue } from 'vue-property-decorator';
import { movieItem } from '@/interface/movieItem'
@Component({
    name: 'MovieItem'
})

export default class extends Vue {
    @Prop({
        required: true
    }) private movie!: movieItem
}
</script>

<style lang="scss" scoped>
.movie-item-wp {
    width: 100%;
    height: 100%;
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
                @include br_color($font-theme1-color);
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
            @include font_color($font-theme1-color);
            &:hover {
                @include hover_font_color($font-theme1-color);
            }
        }
        time {
            line-height: 16px;
            font-size: 12px;
        }
    }
}
</style>