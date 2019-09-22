<template>
    <div class="nav-bg-wp">
        <div class="nav-bg">
            <slot></slot>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    @Component({
        name: 'NavBg'
    })
    export default class extends Vue {}
</script>

<style lang="scss" scoped>
    .nav-bg-wp {
        width: 100%;
        .nav-bg {
            height: 27px;
            line-height: 27px;
            padding: 0 10px;
            margin-bottom: 30px;
            border: 1px solid #bfe4ff;
            background-color: #f7f7ff;
            font-size: 12px;
            color: #555;
            overflow: hidden;
        }
    }
</style>