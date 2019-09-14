<template>
    <div class="movie-nav clearfix">
        <ul>
            <li v-for="m of menus" :key="m.title" class="transition">{{m.title}}</li>
        </ul>
    </div>
</template>

<script lang="ts">
import {Component,Vue} from 'vue-property-decorator';

@Component({
    name: 'MovieNav',
})
export default class extends Vue{
    private menus = [
        {
            title: '首页'
        },
        {
            title: '动作片'
        },
        {
            title: '喜剧片'
        },
        {
            title: '爱情片'
        },
        {
            title: '科幻片'
        },
        {
            title: '剧情片'
        },
        {
            title: '悬疑片'
        },
        {
            title: '战争片'
        },
        {
            title: '惊悚片'
        },
        {
            title: '恐怖片'
        },
        {
            title: '灾难片'
        },
        {
            title: '动画片'
        },
        {
            title: '更多'
        }
    ]
}
</script>

<style lang="scss" scoped>
    .movie-nav {
        min-width: 768px;
        li {
            float: left;
            height: 40px;
            line-height: 40px;
            padding: 0 7px;
            color:#fff;
            cursor: pointer;
            &:hover {
                color: $font-red-color;
            }
        }
    }
</style>