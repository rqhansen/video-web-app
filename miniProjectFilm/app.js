//app.js
const login = require('./utils/login.js');

App({
  onLaunch: function () {
    let token = wx.getStorageSync('token');
    if(token) { // token存在
      wx.checkSession({
        success() {
          
        },
        async fail() { // session_key过期，重新登录
          const { data: { token } } = await login();
          wx.setStorageSync('token', token);
        }
      })
    }
    wx.getUserInfo({
      success: res => {
        // 可以将 res 发送给后台解码出 unionId
        this.globalData.userInfo = res.userInfo
        // console.log(res);
        // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
        // 所以此处加入 callback 以防止这种情况
        if (this.userInfoReadyCallback) {
          this.userInfoReadyCallback(res)
        }
      }
    })
    // 展示本地存储能力
    // var logs = wx.getStorageSync('logs') || []
    // logs.unshift(Date.now())
    // wx.setStorageSync('logs', logs)
    // console.log('onLaunch');

    // 登录(明确在登录的时候再调用)
    // wx.login({
    //   success: res => {
    //     // 发送 res.code 到后台换取 openId, sessionKey, unionId
    //     console.log('登录成功');
    //     console.log('code:'+res.code);
    //   }
    // })

    // 获取用户信息
    // 先通过wx.getSetting查询一下，用户是否授权了获取用户信息
    // 第一次进来没有授权
    // wx.getSetting({
    //   success: res => {
    //     if (res.authSetting['scope.userInfo']) {
    //       // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
    //       wx.getUserInfo({
    //         success: res => {
    //           // 可以将 res 发送给后台解码出 unionId
    //           this.globalData.userInfo = res.userInfo
    //           // console.log(res);
    //           // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
    //           // 所以此处加入 callback 以防止这种情况
    //           if (this.userInfoReadyCallback) {
    //             this.userInfoReadyCallback(res)
    //           }
    //         }
    //       })
    //     } else {
    //       console.log('未授权获取用户信息');
    //     }
    //   }
    // })
  },
  globalData: {
    userInfo: null
  }
})