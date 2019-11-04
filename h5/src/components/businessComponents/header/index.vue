<template>
    <header class="home-header">
        <div class="logo">
            <h1>
                <a href="/" target="_self">
                    <img src="@/assets/images/header/logo.jpg" alt="万寻资源网">
                </a>
            </h1>
        </div>  
        <div class="menu">
            <i class="iconfont icon-more"></i>
        </div>
    </header>
</template>

<script>

export default {
    name: 'Header'
}
</script>

<style lang="scss">
.home-header {
    @include flex(space-between);
    height: 90px;
    padding: 0 20px;
    box-shadow: 0 0 20px #888;
    .logo {
        margin-left: -20px;
        img {
            width: 200px;
            height: 68px;
        }
    }
    .icon-more {
        font-size: 40px;
        color: blue;
    }
}
</style>