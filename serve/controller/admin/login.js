'use strict';
const connection = require('../../database/db');
const { tokenUtils }  = require('../utils.js');
async function adminLogin(ctx) {
    let { userName,password } = ctx.request.body;
    let userInfos = await connection.query('select * from admin'); 
    let [code,message,token] = [-1,'用户名或密码不正确',-1];
    for(let i = 0,len = userInfos.length;i<len;i++) {
        const { username:name,password:pwd } = userInfos[i];
        if(userName === name) {
            if(password === pwd) {
                token = tokenUtils.createToken();
                code = 0;
                message = '登陆成功';
                break;
            }
        }
    }
    ctx.body={
        code: code,
        data: { message,token }
    }
}

module.exports = {
    adminLogin
}