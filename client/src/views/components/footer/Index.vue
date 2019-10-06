<template>
    <div class="footer-wp min-width">
        <div class="section">
            <p>
                <span>Copyright © 2019</span>
                <router-link to="/" target="_self" class="transition">{{$t('footer.webName')}}</router-link>
                <span>Powered by wx520.net</span>
            </p>
            <p>{{$t('footer.explain')}}</p>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    @Component({
        name: 'Footer',
    })

    export default class extends Vue {}
</script>

<style lang="scss" scoped>
    .footer-wp {
        padding: 10px;
        text-align: center;
        color: $font-footer-color;
        line-height: 22px;
        font-size: 12px;
        border-top: 2px solid $font-theme1-color;
        @include br_color($font-theme1-color);
        overflow: hidden;
        a {
            margin: 0 4px;
            cursor: pointer;
            &:hover {
                @include font_color($font-theme1-color);
            }
        }
    }
</style>