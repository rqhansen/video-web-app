import Vue from 'vue'
import Router from 'vue-router'

const Home  = () => import(/* webpackChunkName: "home" */ './views/index/Index.vue');
const TodayMovie = () => import(/* webpackChunkName: "todayMovie" */ './views/todayMovie/Index.vue');
const WeekMovie = () => import(/* webpackChunkName: "weekMovie" */ './views/weekMovie/Index.vue');
const MoreMovie = () => import(/* webpackChunkName: "moreMovie" */ './views/moreMovie/Index.vue');
const ClassifyMovie = () => import(/*webpackChunkName: "classifyMovie" */ './views/classifyMovie/Index.vue');
const MovieDetail = () => import(/*webpackChunkName: "movieDetail" */ './views/movieDetail/Index.vue');
const Search = () => import(/*webpackChunkName: "search" */ './views/search/Index.vue');
const DownLoad = () => import(/*webpackChunkName: "search" */ './views/downLoad/Index.vue');

Vue.use(Router)

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
      path: '/todaymovie',
      name: 'todayMovie',
      component: TodayMovie
    },
    {
      path: '/weekmovie',
      name: 'weekMovie',
      component: WeekMovie
    },
    {
      path: '/moremovie',
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
    },
    {
      path: '/search',
      name: 'search',
      component: Search
    },
    {
      path: '/download',
      name: 'downLoad',
      component: DownLoad
    }
  ],
  scrollBehavior () {
    //期望滚动到哪个位置
    return { x: 0, y: 0 }
  }
})
