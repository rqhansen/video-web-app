<template>
    <section class="channel-item">
        <dl>
            <dt class="channel-title">{{title}}</dt>
            <dd>
                <ul>
                    <li class="channel-list-link ellipsis" v-for="(item,idx) of menuList" :key="idx">
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
.channel-item {
    color: #fff;
    &:not(:last-child) {
        margin-bottom: 6px;
    }
    &.last-movie {
        li {
            width: 50%;
        }
    }
    .channel-title {
        height: 72px;
        padding-left: 10px;
        line-height: 72px;
        font-size: 30px; 
        border-bottom: 1px solid #fff;
    }
    .channel-list-link{
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