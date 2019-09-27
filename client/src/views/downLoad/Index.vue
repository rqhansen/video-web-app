<template>
    <div class="down-load-wp min-width">
        <div class="section">
            <Title />
            <down-load-list />
        </div>
    </div>
</template>

<script lang="ts">
import {Component, Vue} from 'vue-property-decorator';
import Title from './components/Title.vue';
import DownLoadList from './components/DownList.vue';

@Component({
    name: 'downLoad',
    components: {
        Title,
        DownLoadList
    }
})
export default class extends Vue {

}
</script>

<style lang="scss" scoped>
.down-load-wp {
    padding: 10px 15px 0;
}
</style>