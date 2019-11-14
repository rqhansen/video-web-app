<template>
    <header class="home-hd">
        <div class="logo">
            <h1>
                <a href="/" target="_self">
                    <img src="@/assets/images/header/logo.jpg" alt="万寻资源网">
                </a>
            </h1>
        </div>  
        <div class="more" :class="{'block':showDropMenu}" @click="switchDropMenu">
            <b></b>
            <b></b>
            <b></b>
        </div>
    </header>
</template>

<script>

export default {
    name: 'Header',
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
.home-hd {
    position: relative;
    @include flex(space-between);
    height: 90px;
    padding: 0 16px;
    box-shadow: 0 0 20px #888;
    z-index: 20;
    .logo {
        margin-left: -20px;
        img {
            width: 200px;
            height: 70px;
        }
    }
    .more {
        width: 50px;
        height: 35px;
        > b {
            display: block;
            width: 52px;
            height: 5px;
            background-color: #004a84;
            margin: 10px 0 ;
            transition: all .3s linear; 
            &:first-child {
                margin-top: 0;
            }
        }
    }
    .block {
        position: relative;
        >b {
            position: absolute;
            right: 4px;
            top: 13px;
            &:first-child {
                transform: rotate(45deg);
            }
            &:nth-child(2) {
                display: none;
            }
            &:last-child {
                top: 3px;
                transform: rotate(-45deg);
            }
        }
    }
}
</style>