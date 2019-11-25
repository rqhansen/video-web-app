import Vue from 'vue';
import Router from 'vue-router';

const Home = () => import(/* webpackChunkName: "home" */ './views/home/Index.vue');
const MovieDetail = () => import(/* webpackChunkName: "movieDetail" */ './views/movieDetail/Index.vue');

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
            path: '/:movie_type/:id',
            name: 'movieDetail',
            component: MovieDetail
        }
    ]
})