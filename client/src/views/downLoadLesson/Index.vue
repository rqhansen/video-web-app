<template>
    <div class="down-load-lesson-wp min-width">
        <div class="section">
            <Title/>
            <lesson-detail/>
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import {mixins} from 'vue-class-component';
import Title from './components/Title.vue';
import LessonDetail from './components/LessonDetail.vue';
import setTitleAndMetaMixin from '@/mixins/setTitle';
@Component({
    name: 'downLoadLesson',
    components: {
        Title,
        LessonDetail
    }
})
export default class extends mixins (setTitleAndMetaMixin) {}
</script>

<style lang="scss" scoped>
    .down-load-lesson-wp {
        padding: 10px 15px 0;
    }
</style>