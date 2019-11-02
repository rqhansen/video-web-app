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
    name: 'FastNav',
    computed: {
        menus() {
            return [
                {
                    title: this.$t('header.todayMovie'),
                    routeName: 'todaymovie'
                },
                {
                    title: this.$t('header.weekMovie'),
                    routeName: 'weekmovie'
                },
                {
                    title: this.$t('header.saveWebSite'),
                }
            ]
        }
    }
})
export default class extends Vue{
    get currRouteName() {
        return this.$route.name;
    }
    private goPage(rName: string) {
        if(!rName) {
            this.$message({
                message: window.vm.$t('messages.save'),
                center: true,
                showClose: true,
                type: 'success',
                duration: 1500
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
                @include font_color($font-theme1-color);
            }
            &:hover {
                @include font_color($font-theme1-color);
            }
        }
    }
</style>