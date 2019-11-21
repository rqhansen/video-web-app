<template>
    <section class="m-item">
        <dl>
            <dt>{{title}}</dt>
            <dd>
                <ul>
                    <li class="ellipsis" v-for="(item,idx) of menuList">
                        <router-link :to="item.url">{{item.name}}</router-link>
                    </li>
                </ul>
            </dd>
        </dl>
    </section>
</template>

<script>
    export default {
        props: {
            title: {
                required: true,
                type: String
            },
            menuList: {
                required: true,
                type: Array
            }
        }
    }
</script>

<style lang="scss" scoped>
.m-item {
    color: #fff;
    &:not(:last-child) {
        margin-bottom: 6px;
    }
    &.last-movie {
        li {
            width: 50%;
        }
    }
    dt {
        height: 72px;
        padding-left: 10px;
        line-height: 72px;
        font-size: 30px; 
        border-bottom: 1px dashed #fff;
    }
    li {
        display:inline-block;
        width: 25%;
        height: 72px;
        padding: 0 6px;
        text-align: center;
        line-height: 72px;
        font-size: 30px;
        background:none;
        >a {
            color: #fff;
        }
    }
}
</style>