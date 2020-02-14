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

Vue.use(Router)

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
      path: '/movie/:id',
      name: 'classifyMovie',
      component: ClassifyMovie,
      meta: {
        scrollTop: 0
      }
    },
    {
      path: '/:movie_type/:id',
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

// 返回时上一个页面滚动到指定位置
router.beforeEach((to,from,next) => {
  // @ts-ignore
  const routeName = from.name;
  const toRouteName = to.name;
  if(routeName) {
    const routeNames = ['movieDetail','search','notFind','downLoad','downLoadLesson'];
    if(routeNames.indexOf(routeName) == -1) {
      if(toRouteName === 'classifyMovie' && routeName === 'classifyMovie') {
        from.meta.scrollTop = 0;
      } else {
        // @ts-ignore
        const scrollTop = document.getElementById('app').scrollTop;
        from.meta.scrollTop = scrollTop;
      }
    } else {
      from.meta.scrollTop = 0;
    }
  }
  next();
})

export default router;
