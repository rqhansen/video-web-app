<template>
    <div class="switch-theme-wp">
        <div class="menu-wp">
            <span class="txt transition">换肤</span>
        </div>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';

    @Component({
        name: 'SwitchTheme'
    })

    export default class extends Vue {}
</script>

<style lang="scss" scoped>
.switch-theme-wp {
    .menu-wp {
        font-size: 13px;
        line-height: 30px;
        .txt {
            cursor: pointer;
            &:hover {
                color: $font-theme-color;
            }
        }
    }
}
</style>