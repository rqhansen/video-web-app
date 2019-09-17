
const { query } = require('../database/db');
const { movieTypes, limitSeconds } = require('../config/index');

async function getTypeMovies(ctx) {
    let {page,type} = ctx.request.body;
    let result, typeChar;
    result = await query(`select id,typeId,typeName,indexImgSrc,trim(year),trim(country),trim(pureName),trim(fullName),actor,date_format(pubDate,"%Y-%m-%d"),left(shortIntro,90) from ${type} order by pubDate desc`);
    let { length } = result;
    let { typeId } = result[0];
    console.log(result.length);
    typeChar = Object.values(movieTypes.filter(type => type[`${typeId}`])[0])[0];
    result = result.slice((page-1) * 14, (page-1) * 14 + 14);
    result.forEach(item => {
        item.year = item['trim(year)'];
        item.country = item['trim(country)'];
        item.pureName = item['trim(pureName)'];
        item.pubDate = item['date_format(pubDate,"%Y-%m-%d")'];
        item.shortIntro = item['left(shortIntro,90)'];
        item.shortIntro = item.shortIntro ? item.shortIntro.split('$').join('') : '';
        let fullName = item['trim(fullName)'];
        item.sharpness = fullName ? fullName.split(item.pureName)[1] : '';
        item.actor = item.actor ? item.actor.split('$').slice(0, 1) : '';
        item.isNew = new Date() - new Date(item.pubDate) < limitSeconds;
        delete item.typeId;
        delete item['trim(country)'];
        delete item['trim(year)'];
        delete item['trim(pureName)'];
        delete item['date_format(pubDate,"%Y-%m-%d")'];
        delete item['trim(fullName)'];
        delete item['left(shortIntro,90)'];
    })
    ctx.body = {
        code: 0,
        data: {
            typeMovie: result,
            typeChar,
            total: length
        }
    }
}

module.exports = {
    getTypeMovies
}