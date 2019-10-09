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

@Component({
    name: 'moreMovie',
    components: {
        TitleBar,
        MovieList
    }
})

export default class extends mixins (setTitleAndMetaMixin) {
    private moreMovieFun = getMoreMovie;

    @Watch('$i18n.locale')
    private changeMoreMovieTitleMeta() {
        // @ts-ignore
        if(this.$route.mame === 'moreMovie') {
            this.changeMTitleAndMeta();
        }
    }
    
    // @ts-ignore
    beforeRouteEnter(to,from, next) {
        // @ts-ignore
        next(vm => {
            vm.changeMTitleAndMeta();
        })
    }

    private changeMTitleAndMeta() {
        const vm = window.vm;
        this.changeTitleAndMeta(
        vm.$t('title.indexTitle'),
        vm.$t('title.indexKeyWords'),
        vm.$t('title.indexDesription')
      );
    }
}
</script>

<style lang="scss" scoped>

</style>