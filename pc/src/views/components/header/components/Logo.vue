<template>
    <div class="logo">
        <h1>
            <div class="img-wp" @click="goHome">
                <img src="/common/images/logo.jpg" :title="$t('header.title')">
            </div>
        </h1>
    </div>
</template>

<script lang="ts">
    import { Component, Vue, Watch } from 'vue-property-decorator';
    import { Route } from 'vue-router';
    @Component({
        name: 'Logo'
    })

    export default class extends Vue {

        //点击logo
        private goHome() {
            window.open('/','_blank');
        }
    }
</script>

<style lang="scss" scoped>
    .logo {
        width: 100%;
        height: 100%;
        h1 {
            width: 100%;
            height: 100%;
            margin-left: -22px;
            .img-wp {
                display: block;
                width:100%;
                height: 100%;
                cursor: pointer;
            }
        }
        img {
            width: 200px;
            height: 66px;
        }
    }
</style>