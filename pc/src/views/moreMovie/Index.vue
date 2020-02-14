<template>
    <div class="more-movie-wp">
        <div class="section">
            <title-bar :isShowMore="false" :title="$t('todayMovie.todayMovieIntroduce')"/>
            <movie-list :handleMovieFun="moreMovieFun"/>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Watch, Vue } from 'vue-property-decorator';
import { mixins } from 'vue-class-component';
import { getMoreMovie } from '@/apis/moreMovie';
import TitleBar from '@/components/TitleBar.vue';
import MovieList from '@/components/MovieList.vue';
import setTitleAndMetaMixin from '@/mixins/setTitle';
import scrollBackMixin from '@/mixins/scrollBack';

@Component({
    name: 'moreMovie',
    components: {
        TitleBar,
        MovieList
    }
})

export default class extends mixins (setTitleAndMetaMixin,scrollBackMixin) {
    private moreMovieFun = getMoreMovie;
}
</script>

<style lang="scss" scoped>

</style>