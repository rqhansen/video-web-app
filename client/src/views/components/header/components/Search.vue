<template>
    <div class="search">
        <el-input type="text" @keyup.native.enter.exact="search" v-model.trim="movieName" placeholder="输入电影名称搜索..." clearable></el-input>
        <div class="btn-wp">
            <el-button 
                type="primary" 
                size="middle" 
                :round="false" 
                icon="el-icon-search" 
                @click.stop="search">搜索</el-button>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    import {PageModule} from '@/store/modules/page';
    @Component({
        name: 'Search'
    })

    export default class extends Vue {
        private movieName = '';
        // private page: any = '';

        get currentPage() {
            return PageModule.page
        }
        private search() {
            // debugger;
            if(!this.movieName) return;
            const query = this.$route.query;
            if(query.keyword && query.page) {
                let {keyword,page} = query;
                if(this.movieName === keyword && this.currentPage == page) return;
                // debugger;
                // this.page = pag
                if(this.movieName !== keyword) {
                    page = 1;
                }
                this.$router.push(`/search?keyword=${this.movieName}&page=${page}`);
            } else if(!query.keyword && !query.page) {
                // this.page = '1';
                this.$router.push(`/search?keyword=${this.movieName}&page=1`);
            }
        }
    }
</script>

<style lang="scss" scoped>
    .search {
        display: flex;
        justify-content: flex-start;
        .el-input {
            /deep/ .el-input__inner {
                width: 396px;
                height: 38px;
                border-radius: 0;
                border-right: none;
            }
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
    @media (max-width: 767px) {
        .search {
            width: 100%;
            .el-input {
                width: 80%;
                 /deep/ .el-input__inner {
                    width: 100%;
                    height: 38px;
                    border-radius: 0;
                    border-right: none;
                }
            }
             .btn-wp {
                    width: 20%;
                }
                .el-button {
                    width: 100%;
                }
        }
    }
</style>