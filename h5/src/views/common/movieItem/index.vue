<template>
    <section class="movie-item-wp">
        <router-link :to="`/${movie.filmType}/${movie.id}`">
            <div class="poster">
                <img v-lazy="`http://www.wx520.net/public/${movie.indexImgSrc}`" :alt="movie.pureName">
            </div>
            <div class="movie-desc">
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
.movie-item-wp {
    width: 100%;
    height: 100%;
    overflow: hidden;
    img {
        display: block;
        width: 351px;
        height: 432px;
    }
    .movie-desc {
        text-align: center;
        h3 {
            width: 100%;
            padding: 0 5px;
            line-height: 50px;
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