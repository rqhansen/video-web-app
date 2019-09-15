'use strict';
const connection = require('../database/db');
const { movieTypes } = require('../config/index');

async function getTodayMovieSources(ctx) {
    let results = await connection.query(`select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from action where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from comedy where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from romance where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from science where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from drama where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from suspense where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from war where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from thrill where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from horror where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from disaster where to_days(pubDate) = to_days(now())
                                        union select id,typeId,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d"),pubDate from cartoon where to_days(pubDate) = to_days(now()) order by pubDate desc`);
    results.forEach(item => {
        item.filmType = Object.values(movieTypes.filter(type => type[`${item.typeId}`])[0])[0];
        item.pubDate = item['date_format(pubDate,"%Y-%m-%d")'];
        item.isNew = true;
        delete item['date_format(pubDate,"%Y-%m-%d")'];
    })
    ctx.body = {
        code: 0,
        data: {
            movies: results
        }
    }
    // await (ctx.render('todayMovieSources', { results }));
}

module.exports = {
    getTodayMovieSources
}