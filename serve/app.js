
const Koa = require('koa')
const app = new Koa()
const path = require('path');
const static = require('koa-static');
const views = require('koa-views')
const json = require('koa-json')
const onerror = require('koa-onerror')
const bodyparser = require('koa-bodyparser')
//配置vue的history模式
const history = require('connect-history-api-fallback'); 
const { tokenUtils } = require('./controller/utils.js');
// const logger = require('koa-logger')



const router = require('./routes/index')
// error handler
onerror(app)

app.use(static(path.join(__dirname, '/')));

app.use(async (ctx, next) => {
  await next();
  ctx.set('X-Powered-By', 'koa2');
})

// 验证token是否过期
app.use(async (ctx,next) => {
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
})

// middlewares
app.use(bodyparser({
  enableTypes: ['json', 'form', 'text']
}))
app.use(json())
// app.use(logger())
// app.use(require('koa-static')(__dirname,'public'))


app.use(views(__dirname + '/views', {
  extension: 'ejs'
}))

// logger
app.use(async (ctx, next) => {
  const start = new Date()
  await next()
  const ms = new Date() - start
  console.log(`${ctx.method} ${ctx.url} - ${ms}ms`)
})

// routes
app.use(router.routes());

// error-handling
app.on('error', (err, ctx) => {
  console.error('server error', err, ctx)
});

app.use(history());
app.listen(process.env.PORT || 82);

module.exports = app
