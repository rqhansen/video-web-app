<template>
    <div class="empty-wp">
        <div class="empty">
            <span>{{$t('search.emptyData')}}</span>
        </div>
    </div>
</template>

<script lang="ts">
import { Component,Vue } from 'vue-property-decorator';

@Component({
    name: 'emptyData'
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
        }
        span {  
            color: #999;
            line-height: 200px;
            font-size: 18px;
        }
    }
</style>