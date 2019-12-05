<template>
    <header class="m-header">
        <!-- logo -->
        <logo/>
        <!-- logo结束 -->
        <!-- 右侧菜单 -->
        <more @switch-drop-menu="switchDropMenu"/>
        <!-- 右侧菜单结束 -->
        <!-- 下拉菜单 -->
        <drop-menu :showMenu="showDropMenu"/>
        <!-- 下拉菜单结束 -->
    </header>
</template>

<script>
import Logo from './component/logo'
import More from './component/more'
import DropMenu from './component/dropMenu'
export default {
    name: 'Header',
    components: { Logo, More, DropMenu },
    data() {
        return {
            showDropMenu: false
        }
    },
    methods: {
        switchDropMenu() {
            this.showDropMenu = !this.showDropMenu;
        }
    }
}
</script>

<style lang="scss" scoped>
.m-header {
    position: relative;
    @include flex(space-between);
    height: 90px;
    padding: 0 16px;
    box-shadow: 0 0 20px #888;
    z-index: 20;
}
</style>