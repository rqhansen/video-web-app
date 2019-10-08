<template>
    <div class="poster-wp">
        <div class="poster" :style="`background-image:url(http://www.wx520.net/public/${src})`"></div>
    </div>
</template>

<script lang="ts">
    import { Component, Prop, Vue } from 'vue-property-decorator';
    @Component({
        name: 'Poster'
    })
    export default class extends Vue {
        @Prop({
            required: true,
        }) private src!: string
    }
</script>

<style lang="scss">
    .poster-wp {
        width: 100%;
        height: 100%;
        .poster {
            width: 100%;
            height: 0;
            padding-top: 121.5%;
            overflow: hidden;
            background-repeat: no-repeat;
            background-size: cover;
        }
    }
</style>