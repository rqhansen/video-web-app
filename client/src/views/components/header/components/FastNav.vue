<template>
    <div class="fast-nav">
        <ul>
            <li v-for="m of menus" :key="m.title" class="transition"><span @click="goPage(m.routeName)">{{m.title}}</span></li>
        </ul>
    </div>
</template>

<script lang="ts">
const MENU = [
        {
            title: '今日最新电影',
            routeName: 'todayMovie'
        },
        {
            title: '近一周最新电影',
            routeName: 'weekMovie'
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
            &:hover {
                color: $font-theme-color;
            }
        }
    }
</style>