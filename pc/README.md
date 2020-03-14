
# vue2.0与Koa2构建的电影网站PC版

[点击在线预览](https://www.wanxunm.com)

## 描述

写这个项目的目的一是为了进一步熟悉vue2.0相关的知识点，typescript在vue项目中的应用。二是为了熟悉使用Koa2搭建后端服务器,体验后端接口的设计方式。三是为了熟悉nginx搭建web服务器,加深理解nginx如何作为http静态资源服务器和反向代理服务器。


## 技术栈 

vue + vuex + vue-router + vue-cli3 + typescipt + axios + element-ui + scss  + koa2 + nginx 


## 项目下载

https://github.com/rqhansen/video-web-app.git

## 项目运行

### 前后端安装

```
npm install
```

### 前端运行

```
npm run serve
```

### 后端运行

```
npm start
```

## 注意

```
server目录为服务端代码,端口为82。 pc目录为前端pc端代码，端口8080，

由于服务器上的数据库访问设置的是指定IP访问，所以项目运行起来后，界面上并显示数据，

因为是个人的在线项目，备案问题，一般情况下线上不能正常预览。

```

## 功能列表

- [x] 切换主题 -- 完成
- [x] 切换语言(静态) -- 完成
- [x] 搜素电影 -- 完成
- [x] 收藏本站 -- 完成
- [x] 最新电影列表 -- 完成
- [x] 更多最新电影列表 -- 完成
- [x] 分类电影列表 -- 完成
- [x] 分页请求 -- 完成
- [x] 电影详情 -- 完成
- [x] 后台登录 -- 完成
- [x] 后台登录权限 -- 完成
- [x] 后台添加电影 -- 完成

## 部分截图

<img src="https://github.com/rqhansen/video-web-app/blob/master/pc/images/pc-four.png"/>

<img src="https://github.com/rqhansen/video-web-app/blob/master/pc/images/pc-index.png"/>

<img src="https://github.com/rqhansen/video-web-app/blob/master/pc/images/pc-two.png"/>

<img src="https://github.com/rqhansen/video-web-app/blob/master/pc/images/pc-three.png"/>

