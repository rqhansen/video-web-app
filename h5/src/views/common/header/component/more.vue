<template>
    <div class="h-link-more" :class="{'block':showMenu}" @click="switchDropMenu">
        <b></b>
        <b></b>
        <b></b>
    </div>
</template>

<script>
export default  {
    name: 'More',
    props: {
        showMenu: {
            required: true
        }
    },
    methods: {
        switchDropMenu() {
            this.$emit('update:showMenu',!this.showMenu);
        }
    }
}
</script>

<style lang="scss" scoped>
.h-link-more {
    width: 50px;
    height: 35px;
    > b {
        display: block;
        width: 100%;
        height: 5px;
        background-color: #004a84;
        margin: 10px 0 ;
        transition: all .3s linear; 
        &:first-child {
            margin-top: 0;
        }
    }
    &.block {
        position: relative;
        margin-top: 4px;
        >b {
            position: absolute;
            right: -6px;
            top: 14px;
            &:first-child {
                transform: rotate(45deg);
            }
            &:nth-child(2) {
                display: none;
            }
            &:last-child {
                top: 4px;
                transform: rotate(-45deg);
            }
        }
    }
}
</style>