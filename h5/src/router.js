import Vue from 'vue';
import Router from 'vue-router';

const Home = () => import(/* webpackChunkName: "home" */ './views/home/Index.vue');
const MovieDetail = () => import(/* webpackChunkName: "movieDetail" */ './views/movieDetail/Index.vue');
const Search = () => import(/* webpackChunkName: "search" */ './views/search/Index.vue');
const MoreMovie = () => import(/* webpackChunkName: "moreMovie" */ './views/moreMovie/Index.vue');
const TypeMovie = () => import(/* webpackChunkName: "typeMovie" */ './views/typeMovie/Index.vue');
const WeekMovie = () => import(/* webpackChunkName: "weekMovie" */ './views/weekMovie/Index.vue');
const DownLoadThunder = () =>import(/* webpackChunkName: "downLoadThunder" */ './views/downLoadThunder/Index.vue');
const DownLoadLesson = () => import(/* webpackChunkName: "downLoadLesson" */ './views/downLoadLesson/Index.vue')
const notFind = () =>import(/* webpackChunkName: "notFind" */ './views/notFind/Index.vue');
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
        },
        {
            path: '/downLoadThunder',
            name: 'downLoadThunder',
            component: DownLoadThunder
        },
        {
            path: '/downLoadLesson',
            name: 'downLoadLesson',
            component: DownLoadLesson
        },
        {
            path: '*',
            name: 'notFind',
            component: notFind
        }
    ]
})