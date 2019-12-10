<template>
    <header class="m-header">
        <!-- logo -->
        <logo/>
        <!-- logo结束 -->
        <!-- 右侧菜单 -->
        <more :showMenu.sync="showDropMenu"/>
        <!-- 右侧菜单结束 -->
        <!-- 下拉菜单 -->
        <transition name="fade-down">
            <drop-menu v-if="showDropMenu" @hide-drop-menu="showDropMenu=false;"/>
        </transition>
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
    .fade-down-enter,.fade-down-leave-to {
        height:0;
        padding-top: 0;
    }
    .fade-down-enter-active,.fade-down-leave-active {
        transition: height padding-top .3s cubic-bezier(.97,-0.07,.04,1.09);
    }
}
</style>