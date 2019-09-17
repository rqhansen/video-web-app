<template>
    <div class="empty-wp">
        <div class="empty">
            <span>暂无数据</span>
        </div>
    </div>
</template>

<script lang="ts">
import { Component,Vue } from 'vue';

@Component({
    name: 'empty'
})

export default class extends Vue{
    
}
</script>

<style lang="scss" scoped>
    .empty-wp {
        width: 100%;
        height: 100%;
        overflow: hidden;
        .empty {
            text-align: center;
            line-height: 100px;
        }
        span {  
            // color: #
        }
    }
</style>