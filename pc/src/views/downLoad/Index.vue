<template>
    <div class="down-load-wp min-width">
        <div class="section">
            <Title />
            <down-load-list />
        </div>
    </div>
</template>

<script lang="ts">
import {Component, Watch, Vue} from 'vue-property-decorator';
import {mixins} from 'vue-class-component';
import Title from './components/Title.vue';
import DownLoadList from './components/DownList.vue';
import setTitleAndMetaMixin from '@/mixins/setTitle';
@Component({
    name: 'downLoad',
    components: {
        Title,
        DownLoadList
    }
})
export default class extends mixins (setTitleAndMetaMixin) {}
</script>

<style lang="scss" scoped>
.down-load-wp {
    padding: 10px 15px 0;
}
</style>