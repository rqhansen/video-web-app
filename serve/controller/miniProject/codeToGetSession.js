'use strict';
const connection = require('../../database/db');
const request = require('request');
const { tokenUtils } = require('../utils.js'); 

const APPID = 'wx87f2924401f91b7f'; // 小程序的APPID
const SECRET = '73b6d6f00d6d64c803cc8a6ded428fd8';

async function getSession(ctx) {
    const { code } = ctx.request.body;
    const res = await getOpenId(code);
    ctx.body = res;
}

function getOpenId(code) {
    return new Promise((resolve,reject) =>{
        let body1 = {
            code: -1,
            data: {
                msg: '获取session_key失败'
            }
        }
        request(`https://api.weixin.qq.com/sns/jscode2session?appid=${APPID}&secret=${SECRET}&js_code=${code}&grant_type=authorization_code`,async (error,res,body) =>{
            if(error) { // 请求失败
                resolve(body1);
            } else {
                const {session_key:sessionkey,openid} = JSON.parse(body);
                const minToken = tokenUtils.createMinToken(sessionkey,openid);
                const result = await connection.query(`insert into miniuser values ("${openid}","${sessionkey}")`);
                if(result) {
                    const body2 = {
                        code: 0,
                        data: {
                            token: minToken,
                        }
                    }
                    resolve(body2);
                } else {
                    body1.data.msg = '插入数据失败';
                    resolve(body1);
                }
            }
        });
    })
}   

module.exports = {
    getSession
}
