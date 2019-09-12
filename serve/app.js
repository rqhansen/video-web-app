
const Koa = require('koa')
const app = new Koa()
const path = require('path');
const static = require('koa-static');
const views = require('koa-views')
const json = require('koa-json')
const onerror = require('koa-onerror')
const bodyparser = require('koa-bodyparser')
// const logger = require('koa-logger')



const router = require('./routes/index')
// error handler
onerror(app)

app.use(static(path.join(__dirname, '/')));

app.use(async (ctx, next) => {
  await next();
  ctx.set('X-Powered-By', 'koa2');
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

app.listen(process.env.PORT || 6666);

module.exports = app
