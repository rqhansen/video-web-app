import Vue from 'vue';
import Router from 'vue-router';

const Home = () => import(/* webpackChunkName: "home" */ './views/home/Index.vue');
const MovieDetail = () => import(/* webpackChunkName: "movieDetail" */ './views/movieDetail/Index.vue');
const Search = () => import(/* webpackChunkName: "search" */ './views/search/Index.vue');
const MoreMovie = () => import(/* webpackChunkName: "MoreMovie" */ './views/moreMovie/Index.vue');
const TypeMovie = () => import(/* webpackChunkName: "TypeMovie" */ './views/typeMovie/Index.vue');
const WeekMovie = () => import(/* webpackChunkName: "WeekMovie" */ './views/weekMovie/Index.vue');
Vue.use(Router);

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home
        },
        {
            path: '/movie/:id',
            name: 'typeMovie',
            component: TypeMovie
        },
        {
            path: '/:movie_type/:id',
            name: 'movieDetail',
            component: MovieDetail
        },
        {
            path: '/search',
            name: 'search',
            component: Search
        },
        {
            path: '/moremovie',
            name: 'moreMovie',
            component: MoreMovie
        },
        {
            path: '/weekMovie',
            name: 'weekMovie',
            component: WeekMovie
        }
    ]
})