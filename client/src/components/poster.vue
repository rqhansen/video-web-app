<template>
    <div class="poster-wp">
        <!-- <div class="poster" :style="`background-image:url(http://www.wx520.net/public/${src})`">
        </div> -->
        <div class="poster">
            <a class="img-wp" title="">
                <img class="lazy-img" width="auto" height="auto" :src="`http://www.wx520.net/public/${src}`" alt="">
            </a>
        </div>
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
            position: relative;
            width: 100%;
            height: 0;
            padding-top: 121.5%;
            overflow: hidden;
            .lazy-img {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
            }
        }
        .img-wp {
            display: block;
            width: 100%;
            height: 100%;
        }
    }
</style>