<template>
    <div class="logo">
        <h1>
            <router-link to="/">
                <img src="@imgs/header/logo.jpg" title="万寻资源网">
            </router-link>
        </h1>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator';
    @Component({
        name: 'Logo'
    })

    export default class extends Vue {

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
            a {
                display: block;
                width:100%;
                height: 100%;
            }
        }
        img {
            width: 200px;
            height: 66px;
        }
    }
</style>