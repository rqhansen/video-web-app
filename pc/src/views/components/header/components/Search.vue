<template>
    <div class="search">
        <div class="input-wp">
            <el-input type="text" @keyup.native.enter.exact="search" v-model.trim="movieName" :placeholder="$t('header.placeholder')" clearable></el-input>
        </div>
        <div class="btn-wp">
            <el-button 
                type="primary" 
                size="middle" 
                :round="false" 
                icon="el-icon-search" 
                @click.stop="search">{{$t('header.search')}}</el-button>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    import {SearchModule} from '@/store/modules/search';
    @Component({
        name: 'Search'
    })

    export default class extends Vue {
        private movieName = '';
        
        get currentPage() {
            return SearchModule.searchInfo.page;
        }
        private search() {
            if(!this.movieName) return;
            const searchData = this.getSearchData();
            if(!searchData) return;
            const { page, movieName} = searchData;
            this.$router.push(`/search?keyword=${movieName}&page=${page}`)
        }

        private getSearchData() {
            const { query } = this.$route;
            if  ( query.keyword && query.page) {
                let {keyword,page} = query;
                if(this.movieName === keyword) {
                    if(this.currentPage === page) {
                        if (page === '1') return;
                        page = '1';
                    }
                } else {
                    page = '1';
                }
                return { page,movieName: this.movieName }
            }   else if(!query.keyword && !query.page) {
                    return { page: 1, movieName: this.movieName
                }
            }
        } 
    }
</script>

<style lang="scss" scoped>
    .search {
        .input-wp {
            display: inline-block;
            vertical-align: top;
            width: 396px;
        }
        .el-input {
            /deep/ .el-input__inner {
                width: 100%;
                height: 38px;
                border-radius: 0;
                border-right: none;
            }
        }
        .btn-wp {
            display: inline-block;
            vertical-align: top;
        }
        .el-button {
            width: 112px;
            height: 38px;
            padding: 0;
            line-height: 38px;
            font-size: 16px;
            border-radius: 0;
        }
    }
</style>