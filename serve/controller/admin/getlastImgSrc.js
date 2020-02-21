'use strict';
const connection = require('../../database/db');
const { movieTypes } = require('../../config/index');
async function getlastImgSrc(ctx) {
    const { typeId } = ctx.request.body;
    let tableName = '';
    for(let i=0,len=movieTypes.length;i<len;i++) {
        const typeName = movieTypes[i][typeId];
        if(typeName) {
            tableName = typeName;
            break;
        }
    }
    const result = await connection.query(`select indexImgSrc,detailImgSrc from ${tableName} where id=(select max(id) from ${tableName});`);
    ctx.body = {
        code: 0,
        data: result[0]
    }
}
module.exports = {
    getlastImgSrc
}