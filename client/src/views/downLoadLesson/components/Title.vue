<template>
    <div class="lesson-title">
        <div class="title">
            <span>迅雷五下载教程</span>
        </div>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    @Component({
        name: 'lessonTitle'
    })
export default class extends Vue {}
</script>

<style lang="scss" scoped>
    .lesson-title {
        width: 100%;
        .title {
            line-height: 42px;
            font-size: 22px;
            border-bottom: 1px solid #ececec;
        }
    }
</style>