import Vue from 'vue'
import Router from 'vue-router'

const Home  = () => import(/* webpackChunkName: "home" */ './views/index/Index.vue');
const WeekMovie = () => import(/* webpackChunkName: "weekMovie" */ './views/weekMovie/Index.vue');
const MoreMovie = () => import(/* webpackChunkName: "moreMovie" */ './views/moreMovie/Index.vue');
const ClassifyMovie = () => import(/*webpackChunkName: "classifyMovie" */ './views/classifyMovie/Index.vue');
const MovieDetail = () => import(/*webpackChunkName: "movieDetail" */ './views/movieDetail/Index.vue');
const Search = () => import(/*webpackChunkName: "search" */ './views/search/Index.vue');
const DownLoad = () => import(/*webpackChunkName: "downLoad" */ './views/downLoad/Index.vue');
const DownLoadLesson = () => import(/*webpackChunkName: "downLoadLesson" */ './views/downLoadLesson/Index.vue');
const NotFind = () => import(/* webpackChunkName: "notFind" */ './views/notFind/Index.vue');
// 后台登录界面
const adminLogin = () => import(/*webpackChunkName: "adminLogin"*/ './views/admin/login/Index.vue');

Vue.use(Router)

const allTypeMovieId = 'action|comedy|romance|science|drama|suspense|war|thrill|horror|disaster|cartoon';

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        scrollTop: 0
      }
    },
    {
      path: '/weekmovie',
      name: 'weekMovie',
      component: WeekMovie,
      meta: {
        scrollTop: 0
      }
    },
    {
      path: '/moremovie',
      name: 'moreMovie',
      component: MoreMovie,
      meta: {
        scrollTop: 0
      }
    },
    {
      path: `/movie/:id(${allTypeMovieId})`,
      name: 'classifyMovie',
      component: ClassifyMovie,
      meta: {
        scrollTop: 0
      }
    },
    {
      path: '/:movie_type/:id(\\d+)',
      name: 'movieDetail',
      component: MovieDetail,
      meta: {
        scrollTop: 0
      }
    },
    {
      path: '/search',
      name: 'search',
      component: Search,
      meta: {
        scrollTop: 0
      }
    },
    {
      path: '/downLoadThunder',
      name: 'downLoad',
      component: DownLoad,
      meta: {
        scrollTop: 0
      }
    },
    {
      path: '/downloadlesson',
      name: 'downLoadLesson',
      component: DownLoadLesson,
      meta: {
        scrollTop: 0
      }
    },
    { //后台部分
      path: '/admin-login',
      name: 'adminLogin',
      component: adminLogin
    },
    {
      path: '*',
      name: 'notFind',
      component: NotFind,
      meta: {
        scrollTop: 0
      }
    }
  ]
})

// 即将进到一个新的页面时保存上一个页面的滚动位置,在上一个页面的生命周期函数activated中取值
router.beforeEach((to,from,next) => {
  const routeName = from.name;
  const toRouteName = to.name;
  if(routeName) {
    const routeNames = ['movieDetail','search','notFind','downLoad','downLoadLesson'];
    if(!routeNames.includes(routeName)) { // 需要保存滚动位置的路由
      if(toRouteName === 'classifyMovie' && routeName === 'classifyMovie') { // 相同路由跳转
        from.meta.scrollTop = 0;
      } else {
        const scrollTop = (document.getElementById('app') as HTMLElement).scrollTop;
        from.meta.scrollTop = scrollTop;
      }
    } else { // 不需要保存滚动位置的路由
      from.meta.scrollTop = 0;
    }
  }
  next();
})

export default router;
