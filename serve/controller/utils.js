const { movieTypes, limitSeconds } = require('../config/index');


/**
 * 日期转为2019-07-03格式
 * @param {String} dateStr 日期
 */
function formatDate(date) {
    let y = date.getFullYear();
    let m = date.getMonth() + 1;
    let dt = date.getDate();
    m = m >= 10 ? m : `0${m}`;
    dt = dt >= 10 ? dt : `0${dt}`;
    return `${y}-${m}-${dt}`;
}

/**
 * 处理获取首页电影列表后的数据
 */
function handleMovieList(movies) {
    movies.forEach(item => {
        item.filmType = Object.values(movieTypes.filter(type => type[`${item.typeId}`])[0])[0];
        item.pubDate = item['date_format(pubDate,"%Y-%m-%d")'];
        item.isNew = new Date() - new Date(item.pubDate) <= limitSeconds;
        delete item['date_format(pubDate,"%Y-%m-%d")'];
    })
    return movies;
}


module.exports = {
    formatDate,
    handleMovieList
}




