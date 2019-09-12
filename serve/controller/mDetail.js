
const { query } = require('../database/db');
const { movieTypes } = require('../config/index');
const { formatDate } = require('./utils');
/**
 * 获取电影详情
 */
async function getMovieDetail(ctx) {
    let urlSplit = ctx.url.split('/');
    let [type, id] = [urlSplit[2], urlSplit[3]];
    let result = await query(`select * from ${type} where id=${id}`); //查询出来的是一个数组
    result = result[0];
    if (!result) {
        await ctx.render('notFind', { title: '您要找的资源不存在' });
        return;
    }
    let downUrl = result.downUrl;
    let actor = result.actor;
    let getAward = result.getAward;
    let shortIntro = result.shortIntro;
    let pubDate = result.pubDate;
    if (downUrl) {
        result.downUrl = downUrl.split(',');
    }
    if (actor) {
        result.actor = actor.split('$');
    }
    if (getAward) {
        let awardArr = getAward.split('$');
        let flag = /\s/g.test(awardArr.toString());
        result.getAward = flag ? null : awardArr;
    }
    if (shortIntro) {
        result.shortIntro = shortIntro.split('$');
    }
    if (pubDate) {
        result.pubDate = formatDate(pubDate);
    }
    result.filmType = Object.values(movieTypes.filter(type => type[`${result.typeId}`])[0])[0];
    await ctx.render('mDetail', result);
}

module.exports = {
    getMovieDetail
}