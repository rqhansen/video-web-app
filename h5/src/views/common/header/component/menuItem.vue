<template>
    <section class="channel-item">
        <dl>
            <dt class="channel-title">{{title}}</dt>
            <dd>
                <ul>
                    <li class="channel-list-link ellipsis" v-for="(item,idx) of menuList" :key="idx" @click="jump(item.url)">
                        <span>{{item.name}}</span>
                    </li>
                </ul>
            </dd>
        </dl>
    </section>
</template>

<script>
import { mapMutations } from 'vuex';
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
    },
    methods: {
        ...mapMutations(['SET_DROP_MENU_VISIBLE']),
        jump(url) {
            this.hideDropMenu();
            this.$router.push(url);
        },
        hideDropMenu() {
            this.SET_DROP_MENU_VISIBLE(false);
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
    }
}
</style>