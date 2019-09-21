<template>
    <div class="page-wp">
        <el-pagination 
            background 
            layout="total,prev,pager,next,jumper" 
            :total="totalPage"
            :page-size="14"
            :current-page="currentPage"
            @current-change="handleCurrentChange"
            :hide-on-single-page="false"
        >
        </el-pagination>
    </div>
</template>

<script lang="ts">
    import {Component,Emit,Prop,Vue} from 'vue-property-decorator'; 
    @Component({
        name: 'Pagination'
    })

    export default class extends Vue{
        @Prop({
            required: true,
            default: 0
        }) private totalPage!: number

        @Prop({
            required: true,
            default: 1
        }) private currentPage!: number

        @Emit('get-curr-page-data')
        handleCurrentChange(page: number) {
            return page;
        }
    }
</script>

<style lang="scss" scoped>
.page-wp {
    padding: 10px 0;
    text-align: center;
}
</style>