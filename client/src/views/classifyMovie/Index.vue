<template>
    <div class="classify-m-wp">
        <div class="section classify-m">
            <crumbs />
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import crumbs from './componets/crumbs.vue';
@Component({
    name: 'classifyMovie',
    components: {
        crumbs
    }
})
export default class extends Vue {
    
}
</script>

<style lang="scss" scoped>
.classify-m-wp {
    .classify-m {
        padding-top: 30px;
    }
}   
</style>