'use strict';
const connection = require('../database/db');
const { handleMovieList } = require('./utils');

async function getWeekMovieSources(ctx) {
    let results = [];
    let action = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from action where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let comedy = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from comedy where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let romance = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from romance where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let science = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from science where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let drama = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from drama where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let suspense = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from suspense where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let war = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from war where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let thrill = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from thrill where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let horror = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from horror where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let disaster = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from disaster where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    let cartoon = await connection.query(`select id,typeId,typeName,indexImgSrc,fullName,pureName,date_format(pubDate,"%Y-%m-%d") from cartoon where date_sub(curdate(),interval 7 day) <= date(pubDate) order by pubDate desc`);
    if (action.length) {
        results.push(handleMovieList(action));
    }
    if (comedy.length) {
        results.push(handleMovieList(comedy));
    }
    if (romance.length) {
        results.push(handleMovieList(romance));
    }
    if (science.length) {
        results.push(handleMovieList(science));
    }
    if (drama.length) {
        results.push(handleMovieList(drama));
    }
    if (suspense.length) {
        results.push(handleMovieList(suspense));
    }
    if (war.length) {
        results.push(handleMovieList(war));
    }
    if (thrill.length) {
        results.push(handleMovieList(thrill));
    }
    if (horror.length) {
        results.push(handleMovieList(horror));
    }
    if (disaster.length) {
        results.push(handleMovieList(disaster));
    }
    if (cartoon.length) {
        results.push(handleMovieList(cartoon));
    }
    await (ctx.render('weekMovieSources', { results }));
}

module.exports = {
    getWeekMovieSources
}