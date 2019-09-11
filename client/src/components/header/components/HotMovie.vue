<template>
    <div class="m-list">
        <dl>
            <dt><span>热门电影：</span></dt>
            <dd>
                <span v-for="(movie,idx) of movies" :key="idx" class="transition">
                    {{movie}}
                </span>
            </dd>
        </dl>
    </div>
</template>

<script lang="ts">
    import {Component,Vue} from 'vue-property-decorator'
    @Component({
        name: 'HotMovie',
        
    })
    export default class extends Vue {
        //初始化data
        private movies= [
            '昆虫总动员2',
            '速度与激情：特别行动',
            '熊出没：原始时代',
            '银河补习班',
            '扫毒2: 天地对决',
            '追龙2: 贼王'
        ];
    }
</script>

<style lang="scss" scoped>
    .m-list {
        width: 100%;
        height: 30px;
        line-height: 30px;
        font-size: 13px;
        overflow: hidden;
        dt {
            float: left;
        }
        dd {
            float: left;
            color: $font-gray-color;
            span {
                margin: 0 2px;
                cursor: pointer;
                &:hover {
                    color: $--color-primary;
                }
                &.active {
                    color: $--color-primary;
                }
            } 
        }
    }
</style>