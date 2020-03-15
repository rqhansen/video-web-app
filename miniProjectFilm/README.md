
# 简单的电影资讯网站微信小程序版

## 描述

```
写这个项目的目为了熟悉微信小程序原生框架开发小程序。涉及scroll-view组件的横向滚动和竖向滚动，swiper使用，swiper嵌套scroll-view的滑动和
scroll-view与swiper联动效果，微信自带的下拉刷新，上拉加载。组件的封装，wx.request的封装，iconfont的使用等。
```

```
其中授权登录的逻辑：每次一进到页面，先判断storage中是否存有token(这个是服务端由appid和openid生成的签名)，一、存在，通过checksession检查session_key是否过期，1.过期则重新登录（wx.login和业务上的登录）,并更新服务端session_key,2.未过期，不执行任何逻辑(个人理解，如果存在token，则表明微信用户一定授权了登录，而token不存在，用户也可能授权了，所以app.js中，每次都执行获取一下当前的用户信息，如果获取到了用户信息，则我的页面中，就不显示授权登录按钮。现在有一个问题是，用户信息在我的页面展示了，用户会觉得已经登录了，而我本地却没有存储的token。可以这样解决：1.增加一个判断当不存在token时，即使获取到了当前用户有信息，仍然显示授权登录按钮，2.仍然显示用户信息，给用户已经登录的错觉，当请求带权限的接口时，跳到一个登录页面，登录时弹出授权登录的弹层完成登录，再处理业务请求)。二.不存在token,则不执行。当进入tabbar我的页面时，会有授权登录按钮，点击会弹出提示授权登录，授权后会执行wx.login，并完成注册登录，服务端返回token。
客户端：检查session_key
服务端：检查token
```

## 项目下载

https://github.com/rqhansen/video-web-app.git

## 注意

```
由于远程数据库访问设置的是指定IP访问，界面上并显示数据，

```

## 功能列表

- [x] 下拉刷新 -- 完成
- [x] 上拉记载 -- 完成
- [x] swiper滑动 -- 完成
- [x] tab菜单滑动 -- 完成
- [x] swiper与tab的联动 -- 完成
- [x] 获取用户信息 -- 完成
- [x] 授权登录 -- 完成
- [x] 电影搜索 -- 完成
- [x] 电影详情 -- 完成
- [x] 打赏 -- 完成

## 部分截图

<img src="https://github.com/rqhansen/images/tree/master/video-web-app/gif-index.gif"/>

<img src="https://github.com/rqhansen/images/tree/master/video-web-app/gif-two.gif"/>

<img src="https://github.com/rqhansen/images/tree/master/video-web-app/gif-three.gif"/>

<img src="https://github.com/rqhansen/images/tree/master/video-web-app/gif-four.gif"/>


