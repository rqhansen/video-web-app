const { tokenUtils } = require('../controller/utils.js');

/**
 * 验证token
 */
module.exports =  function () {
    return async function (ctx,next){
        const { url,header: { token } } = ctx.request;
        // 添加电影的请求需要校验token
        if(url === '/api/addMovie' || url === '/api/getLastImgSrc') {
          const result = tokenUtils.verifyToken(token);
          const unValidRes = {
            code: -1,
            data: {
              code: 100,
              message: '登录凭证过期，请重新登录'
            }
          };
          if(result) {
            const { time,timeout } = result;
            const unValid = Date.now() - time > timeout;
            if(unValid) { // 凭证过期
              ctx.body = unValidRes;
            } else {
              await next();
            }
          }
          if(!result) { // token不正确
            ctx.body = unValidRes;
          }
        } else {
          await next();
        }
    }
}
