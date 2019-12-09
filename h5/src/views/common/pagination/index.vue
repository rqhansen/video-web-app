<template>
    <curr-bg class="pagination-bar">
        <ul slot="currWp" class="page-list">
            <template v-if="total">
                <li class="home" @click="home"><span>首页</span></li>
                <li v-if="showHome" class="prev" @click="prev"><span>上一页</span></li>
                <li v-if="showNext" class="next" @click="next"><span>下一页</span></li>
                <li @click="end"><span>末页</span></li>
            </template>
            <li class="total">
                <span>共找到</span>
                <span class="page">{{total}}</span>
                <span>条记录</span>
            </li>
        </ul>
    </curr-bg>
</template>

<script>
import CurrBg from '../current';
export default {
    name: 'Pagination',
    components: { CurrBg },
    props: {
        total: {
            required: true
        }
    },
    computed: {
        totalPage() {
            return Math.ceil(this.total / 10);
        },
        currPage() {
            return +this.$route.query.page;
        },
        keyWord() {
            return this.$route.query.keyword;
        },
        showHome() { // 是否显示首页
            return this.currPage > 1;
        },
        showPrev() { // 是否显示上一页
            return this.currPage < this.totalPage && this.currPage >1;
        },
        showNext() { // 是否显示下一页
            return this.currPage < this.totalPage;
        }
    },
    methods: {
        home() {
            if(this.currPage === 1) return;
            this.search(1);
        },
        prev() {
            const page = this.currPage - 1;
            this.search(page);
        },
        next() {
            const page = this.currPage + 1;
            this.search(page);
        },
        end() {
            if(this.currPage === this.totalPage) return;
            this.search(this.totalPage);
        },
        search(page) {
            if(!this.keyWord) return;
            this.$router.push(`/search?keyword=${this.keyWord}&page=${page}`);
        }
    }
}
</script>

<style lang="scss" scoped>
.pagination-bar {
    border: 1px solid #bfe4ff;
    text-align:center;
    font-size: 0;
    li {
        display: inline-block;
        vertical-align: middle;
        padding: 0 10px;
        font-size: 26px;
        font-weight: bold;
        color: #106492;
    }
    .page {
        padding: 0 10px;
    }
}
</style>