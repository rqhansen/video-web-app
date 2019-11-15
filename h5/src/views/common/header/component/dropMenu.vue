<template>
    <section class="drop-menu-wp" :class="{'block':showMenu}">
                
    </section>
</template>

<script>
export default {
    name: 'DropMenu',
    props: {
        showMenu: {
            required: true,
            default: false
        }
    }
}
</script>

<style lang="scss" scoped>
.drop-menu-wp {
    position: absolute;
    left: 0;
    top: 90px;
    width: 100vw;
    height: 0;
    background:rgba(0, 0, 0, .8);
    box-shadow: 1px 2px 5px #888;
    transition: height .3s ease-out;
    &.block {
        height: 850px;
    }
}
</style>