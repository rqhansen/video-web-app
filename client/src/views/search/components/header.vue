<template>
    <div class="header">
        <div><span>{{movieName}}</span>搜素结果</div>
    </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component({
    name: 'sHeader'
})

export default class extends Vue{
    @Prop({
        required: true,
        default: ''
    }) private movieName!: string
}
</script>

<style lang="scss" scoped>
    .header {
        margin-bottom: 20px;
        border: 1px solid #bfe4ff;
        background-color: #f7f7ff;
        line-height: 27px;
        padding: 0 10px;
        font-size: 12px;
        color: #555;
        overflow: hidden;
    }
</style>