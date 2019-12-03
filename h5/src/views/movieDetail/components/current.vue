<template>
    <curr-bg class="curr-bar ellipsis">
        <template slot="currWp">
            <span class="curr-txt">当前位置：</span>
            <router-link to="/" target="_self">万寻电影></router-link>
            <router-link :to="`/movie/${currMovieInfo.filmType}`">{{currMovieInfo.typeName}}</router-link>
            <span>>>{{currMovieInfo.pureName}}下载页面</span>
        </template> 
    </curr-bg>
</template>

<script>
import CurrBg from '@/views/common/current'
export default {
    name: 'Current',
    components: { CurrBg },
    props: {
        currMovieInfo: {
            required: true
        }
    }
}
</script>

<style lang="scss">
.curr-bar{
    border-bottom: 1px solid #bfe4ff;
    .curr-txt {
        margin-right: 5px;
    }
}
</style>