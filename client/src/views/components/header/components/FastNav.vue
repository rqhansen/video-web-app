<template>
    <div class="fast-nav">
        <ul>
            <li v-for="m of menus" :key="m.title" class="transition">{{m.title}}</li>
        </ul>
    </div>
</template>

<script lang="ts">
import {Component,Vue} from 'vue-property-decorator';
@Component({
    name: 'FastNav'
})
export default class extends Vue{
        private menus = [
            {
                title: '今日最新电影',
            },
            {
                title: '近一周最新电影',
            },
            {
                title: '收藏本站'
            }
        ]
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
            &:hover {
                color: $font-theme-color;
            }
        }
    }
</style>