<template>
    <div class="fast-nav">
        <ul class="clearfix">
            <li v-for="m of menus" 
                :key="m.title" 
                class="transition"
                :class="{'active':currRouteName===m.routeName}">
                <span @click="goPage(m.routeName)">{{m.title}}</span>
            </li>
        </ul>
    </div>
</template>

<script lang="ts">
const MENU = [
        {
            title: '今日最新电影',
            routeName: 'todaymovie'
        },
        {
            title: '近一周最新电影',
            routeName: 'weekmovie'
        },
        {
            title: '收藏本站'
        }
    ]

import {Component,Vue} from 'vue-property-decorator';
@Component({
    name: 'FastNav'
})
export default class extends Vue{
    private menus = MENU;

    get currRouteName() {
        return this.$route.name;
    }
    private goPage(rName: string) {
        if(!rName) {
            this.$message({
                message: '请使用Ctrl+D进行添加',
                center: true,
                showClose: true,
                type: 'success'
            });
            return;
        }
        const {name} = this.$route;
        if(name === rName) return;
        this.$router.push(`/${rName}`);
    }
}
</script>

<style lang="scss" scoped>
    .fast-nav {
        li {
            float: left;
            margin: 0 4px;
            color: $font-blue-color;
            font-size: 13px;
            cursor: pointer;
            &:last-child {
                margin-right: 0;
            }
            &.active {
                color: $font-theme-color;
            }
            &:hover {
                color: $font-theme-color;
            }
        }
    }
</style>