'use strict';
const connection = require('../database/db');
const { movieTypes, limitSeconds } = require('../config/index');

/**
 * 获取首页电影列表
 * @param {object} ctx 
*/
async function getHome(ctx) {
    let movies = await connection.query(`select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from action where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from comedy where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from romance where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from science where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from drama where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from suspense where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from war where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from thrill where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from horror where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from disaster where date_sub(curdate(),interval 30 day) <= date(pubDate)
                                        union select id,typeId,indexImgSrc,fullName, pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from cartoon where date_sub(curdate(),interval 30 day) <= date(pubDate) order by pubDate desc limit 24 offset 0`);
    movies.forEach(item => {
        item.filmType = Object.values(movieTypes.filter(type => type[`${item.typeId}`])[0])[0];
        item.pubDate = item['date_format(pubDate,"%Y-%m-%d")'];
        item.isNew = new Date() - new Date(item.pubDate) <= limitSeconds;
        delete item['date_format(pubDate,"%Y-%m-%d")'];
    })
    // await ctx.render('index', { movies });
    // console.log('哈哈哈');
    ctx.body={
        code: 0,
        data: {
            movies
        }
    }
}

module.exports = {
    getHome
}