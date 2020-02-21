'use strict';
const connection = require('../../database/db');
const { movieTypes } = require('../../config/index');
async function addMovie(ctx) {
    let {
        typeId,typeName,fullName,pureName,pubDate,indexImgSrc,detailImgSrc,transName,subPureName,year,country,
        types,language,caption,onDate,imdbScore,imdbLink,format,fileSize,videoSize,filmLength,doubanScore,doubanLink,director
        ,editor,actor,label,shortIntro,getAward,downUrl
    } = ctx.request.body;
    let tableName = '';
    for(let i=0,len=movieTypes.length;i<len;i++) {
        const typeName = movieTypes[i][typeId];
        if(typeName) {
            tableName = typeName;
            break;
        }
    }
    try {
        const result = await connection.query(`insert into ${tableName} (typeId,typeName,fullName,pureName,pubDate,indexImgSrc,detailImgSrc,transName,`+
        `subPureName,year,country,types,language,caption,onDate,imdbScore,imdbLink,format,fileSize,videoSize,`+
        `filmLength,doubanScore,doubanLink,director,editor,actor,label,shortIntro,getAward,downUrl) `+
        `values (${typeId},"${typeName}","${fullName}","${pureName}",STR_TO_DATE("${pubDate}",'%Y-%m-%d %H:%i:%s'),"${indexImgSrc}","${detailImgSrc}",`+
        `'${transName}','${subPureName}','${year}','${country}','${types}','${language}','${caption}','${onDate}','${imdbScore}','${imdbLink}','${format}','${fileSize}','${videoSize}','${filmLength}','${doubanScore}','${doubanLink}','${director}','${editor}','${actor}','${label}',`+
        `'${shortIntro}','${getAward}','${downUrl}')`);
        if(result) {
            ctx.body = {
                code: 0,
                data: {
                    message: '插入电影成功'
                }
            }
        } else {
            ctx.body = {
                code: -1,
                data: {
                    message: '插入电影失败'
                }
            }
        }
    } catch (error) {
        console.log('error');
        console.log(error);
        ctx.body = {
            code: -1,
            data: {
                message: `插入电影失败:${error}`
            }
        }
    }
}

module.exports = {
    addMovie
}