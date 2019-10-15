<template>
    <div class="movie-item-wp">
        <div class="item-poster transition">
            <Poster :src="movie.indexImgSrc" :mName="movie.pureName"/>
        </div>
        <div class="txt" :class="{'new': movie.isNew}">
            <h3 class="ellipsis transition">{{movie.fullName}}</h3>
            <time>{{movie.pubDate}}</time>
        </div>
    </div>  
</template>

<script lang="ts">
import { Component , Prop, Vue } from 'vue-property-decorator';
import { movieItem } from '@/interface/movieItem';
import Poster from './poster.vue';

@Component({
    name: 'MovieItem',
    components: {
        Poster
    }
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
    .item-poster{
        padding: 1px;
        margin-bottom: 3px;
        border: 1px solid $font-border-color;
        cursor: pointer;
        overflow: hidden;
        &:hover {
            @include br_color($font-theme1-color);
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