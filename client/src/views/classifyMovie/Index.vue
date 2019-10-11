<template>
    <div class="classify-m-wp min-width">
        <div class="section classify-m">
            <nav-bg  v-if="movie.length">
                    <crumbs
                    :typeEnName="movieType"
                    :typeZhName="movieTypeName"
                    @get-index-page-data="getIndexPageData"/>
            </nav-bg>
            <page-list 
                :movie="movie"
            />
            <pagination 
                v-if="movie"
                :totalPage="totalPage"
                :currentPage="currPage"
                @get-curr-page-data="getCurPageData"/>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Watch, Vue } from 'vue-property-decorator';
import {Route} from 'vue-router';
import { setTitle, setMeta } from '@/utils/setMeta';
import {getTypeMovie} from '@/apis/typeMovie';
import {Page} from '@/interface/page';
import Crumbs from '@/components/Crumbs.vue';
import PageList from '@/components/PageList.vue';
import Pagination from '@/components/Page.vue';
import NavBg from '@/components/NavBg.vue';
@Component({
    name: 'classifyMovie',
    components: {
        NavBg,
        Crumbs,
        PageList,
        Pagination
    }
})
export default class extends Vue{
    private movie = '';
    private typeZhName = '';
    private totalPage = 0;
    private movieType = '';
    private currPage = 1;

    @Watch('$route')
    private handleRouteChange(to: Route,from: Route) {
        const { path: fromPath } = from;
        const { path: toPath, params: toParams, name: toName } = to;
        if(toName === 'classifyMovie' ) { //跳到分类电影才开始请求
            if(this.movieType === toParams.id) {
                this.setTitleAndMeta();
                return;
            }
            const {id} = toParams;
            this.getCurMovie({
                page: 1,
                type: id
            });
        }
    }

    @Watch('$i18n.locale') 
    private resetTitleAndMeta() {
        if(this.$route.name === 'classifyMovie') {
            this.setTitleAndMeta();
        }
    }

    get movieTypeName() {
        if(window.vm.$i18n.locale === 'en') {
            return this.movieType;
        } else  {
            return this.typeZhName;
        }
    }
    created() {
        const {params: {id}} = this.$route;
        this.getCurMovie({
            page: 1,
            type: id
        });
    }

    //分页事件
    private async getCurPageData(page: number) {
        this.getCurMovie({
            page: page,
            type: this.movieType
        })
    }

    //获取当前页数据
    private async getCurMovie(params: Page) {
        const {data: {code,data: {total,typeMovie}}} = await getTypeMovie(params);
        if(code !== 0) return;
        this.movie = typeMovie;
        this.typeZhName = typeMovie[0].typeName; 
        this.totalPage = total;
        this.currPage = params.page;
        this.movieType = params.type;
        this.setTitleAndMeta();
    }

    //获取首页数据
    private async getIndexPageData() {
        if(this.currPage === 1) return;
        this.getCurMovie({
            page: 1,
            type: this.movieType
        })
    }

    //设置title和meta
    private setTitleAndMeta() {
        const vm = window.vm;
        const language = vm.$i18n.locale;
        let typeName = this.typeZhName;
        if(language === 'en') {
            typeName = this.movieType;
        } 
        setTitle(vm.$t('title.classifyMovieKeyWords', {typeName : typeName}));
        setMeta('keywords','keywords',vm.$t('title.classifyMovieKeyWords', {typeName : typeName}));
        setMeta('description','description',vm.$t('title.classifyMovieDescription',{typeName : typeName}));
    }
}
</script>

<style lang="scss" scoped>
.classify-m-wp {
    .classify-m {
        padding-top: 30px;
    }
}   
</style>