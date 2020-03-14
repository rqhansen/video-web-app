const router = require('koa-router')();
const { getHome } = require('../controller/home');
const { getWeekMovieSources } = require('../controller/weekMovieSources');
const { getMovieDetail } = require('../controller/mDetail');
const { getMore } = require('../controller/more');
const { getTypeMovies } = require('../controller/typeMovie');
const { getSearchResult } = require('../controller/search');
const { adminLogin } = require('../controller/admin/login');
const { addMovie } = require('../controller/admin/addMovie');
const { getlastImgSrc } = require('../controller/admin/getlastImgSrc');
const { getSession } = require('../controller/miniProject/codeToGetSession');

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

// 后台登录
router.post('/adminLogin',adminLogin);

// 后台获取最后一条数据的图片url
router.post('/getLastImgSrc',getlastImgSrc);

// 后台添加电影
router.post('/addMovie',addMovie);

// ------------------------------------微信小程序接口

router.post('/codeToGetSession',getSession);



module.exports = router
