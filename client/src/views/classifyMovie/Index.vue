<template>
    <div class="classify-m-wp">
        <div class="section classify-m">
            <crumbs/>
            <page-list/>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Watch, Vue } from 'vue-property-decorator';
import {Route} from 'vue-router';
import {getTypeMovie} from '@/apis/typeMovie';
import crumbs from './componets/Crumbs.vue';
import PageList from './componets/PageList.vue';
@Component({
    name: 'classifyMovie',
    components: {
        crumbs,
        PageList
    }
})
export default class extends Vue {
    private movie = [];
    private totalPage = 0;
    private movieType = '';

    @Watch('$route')
    private handleRouteChange(route: Route) {
        const params = route.params;
        if(params.id) {
            const id = params.id;
            this.getCurMovie(id);
        }
    }
    created() {
        const {params: {id}} = this.$route;
        this.getCurMovie(id);
    }

    private async getCurMovie(params:string) {
        const {data: {code,data: {total,movieType,typeMovie}}} = await getTypeMovie(params);
        this.movie = typeMovie;
        this.totalPage = total;
        this.movieType = movieType;
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