import Vue from 'vue';
import Router from 'vue-router';

const Home = () => import(/* webpackChunkName: "home" */ './views/home/Index.vue');

Vue.use(Router);

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [
        {
            path: '/',
            name: 'Home',
            component: Home
        }
    ]
})