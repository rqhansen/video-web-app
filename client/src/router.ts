import Vue from 'vue'
import Router from 'vue-router'

const Home  = () => import(/* webpackChunkName: "home" */ './views/index/Index.vue');
const TodayMovie = () => import(/* webpackChunkName: "todayMovie" */ './views/todayMovie/Index.vue');
const WeekMovie = () => import(/* webpackChunkName: "weekMovie" */ './views/weekMovie/Index.vue');
const MoreMovie = () => import(/* webpackChunkName: "moreMovie" */ './views/moreMovie/Index.vue');
const ClassifyMovie = () => import(/*webpackChunkName: "classifyMovie" */ './views/classifyMovie/Index.vue');
const MovieDetail = () => import(/*webpackChunkName: "movieDetail" */ './views/movieDetail/Index.vue');

Vue.use(Router)

export default new Router({
  mode: 'hash',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/todayMovie',
      name: 'todayMovie',
      component: TodayMovie
    },
    {
      path: '/weekMovie',
      name: 'weekMovie',
      component: WeekMovie
    },
    {
      path: '/moreMovie',
      name: 'moreMovie',
      component: MoreMovie
    },
    {
      path: '/movie/:id',
      name: 'classifyMovie',
      component: ClassifyMovie
    },
    {
      path: '/:movie_type/:id',
      name: 'movieDetail',
      component: MovieDetail
    }
  ]
})
