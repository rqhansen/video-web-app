const router = require('koa-router')();
const { getHome } = require('../controller/home');
const { downLoadThurder } = require('../controller/downLoadThurder');
const { downLoadTxt } = require('../controller/downLoadTxt');
const { getTodayMovieSources } = require('../controller/todayMovieSources');
const { getWeekMovieSources } = require('../controller/weekMovieSources');
const { getMovieDetail } = require('../controller/mDetail');
const { getMore } = require('../controller/more');
const { getTypeMovies } = require('../controller/typeMovie');
const { getSearchResult } = require('../controller/search');
const { getNotFind } = require('../controller/notFind');
const typeExp = '(action|comedy|romance|science|drama|suspense|horror|war|thrill|horror|disaster|cartoon|tv)/(index|page_\\d+)';
const detailExp = '(action|comedy|romance|science|drama|suspense|horror|war|thrill|horror|disaster|cartoon|tv)/(\\d+)';


router.prefix('/api')
/**
 * 首页
 */
router.get('/homeMovieList', getHome);

/**
 * 今日最新电影
 */
router.get('/todayMovie', getTodayMovieSources);


/**
 * 近一周最新电影
 */
router.get('/weekMovie', getWeekMovieSources);


/**
 * 更多
 */

router.get('/moreMovie', getMore);

/**
 * 指定类型的电影列表
 */

// router.get(`/${typeExp}/index`, getTypeMovies);

/**
 * 类别电影
 */

router.get(`/${typeExp}`, getTypeMovies);


/**
 * 下载无限制版迅雷
 */
router.get('/html/downThurder', downLoadThurder);

/**
 * 查看下载教程
 */
router.get('/html/downTxt', downLoadTxt);



/**
 * 电影详情
 */
router.get(`/html/${detailExp}`, getMovieDetail);

/**
 * 搜索
 */
router.get('/plus/search', getSearchResult);

/**
 * 404页面
 */
router.get('*', getNotFind);



module.exports = router
