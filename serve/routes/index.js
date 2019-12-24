const router = require('koa-router')();
const { getHome } = require('../controller/home');
const { getWeekMovieSources } = require('../controller/weekMovieSources');
const { getMovieDetail } = require('../controller/mDetail');
const { getMore } = require('../controller/more');
const { getTypeMovies } = require('../controller/typeMovie');
const { getSearchResult } = require('../controller/search');

router.prefix('/api')

//首页
router.get('/homeMovieList', getHome);

//近一周最新电影
router.get('/weekMovie', getWeekMovieSources);

//更多电影
router.get('/moreMovie', getMore);

//分类电影
router.post(`/typeMovie`, getTypeMovies);

//电影详情
router.post(`/getMovieDetail`, getMovieDetail);

//搜索
router.post('/search', getSearchResult);



module.exports = router
