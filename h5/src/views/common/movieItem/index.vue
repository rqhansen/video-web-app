<template>
    <section class="m-item-wp">
        <router-link :to="`/${movie.filmType}/${movie.id}`">
            <div>
                <img v-lazy="`/common/${movie.indexImgSrc}`" :alt="movie.pureName">
            </div>
            <div class="m-title">
                <h3 class="ellipsis">{{movie.fullName}}</h3>
                <time :class="{'new': movie.isNew}">{{movie.pubDate}}</time>
            </div>
        </router-link>
    </section>
</template>

<script>
export default {
    name: 'MoiveItem',
    props: {
        movie: {
            required: true,
            default: () => {}
        }
    }
}
</script>
<style lang="scss" scoped>
.m-item-wp {
    width: 100%;
    height: 100%;
    overflow: hidden;
    img {
        display: block;
        width: 351px;
        height: 432px;
        padding: 2px;
        border: 2px solid transparent;
        @include transition(border);
        &:active {
            border-color: #be1204;
        }
    }
    .m-title {
        text-align: center;
        h3 {
            width: 100%;
            padding: 0 5px;
            line-height: 54px;
            color: #ff0000;
        }
        > time {
            color: #555;
            font-size: 24px;
            &.new {
                color: #ff0000;
            }
        }
    }
}
</style>