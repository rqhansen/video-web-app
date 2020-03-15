const request = require('../../utils/request.js');
const app = getApp();

Page({
  data: {
    userInfo: {},
    hasUserInfo: false,
    mDetail:{},
    subActors: []
  },
  onLoad: async function () {
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse) {
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          app.globalData.userInfo = res.userInfo
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }

    const data = this.getQuery();
    const { data: { movieDetail } } = await request({ url: '/api/getMovieDetail', data: data,method: 'POST'});
    if (!movieDetail) return;
    this.setData({
      mDetail: movieDetail,
      subActors: movieDetail.actor.slice(1)
    });
  },

  // 获取url信息
  getQuery() {
    const pages = getCurrentPages();
    const { options: { id,movieType } } = pages[pages.length-1];
    return { id,movieType };
  },

  // 分享
  onShareAppMessage(res) {
    const { userInfo: { nickName } } = this.data;
    return {
      title: `${nickName}分享最新电影给你`,
      path: 'pages/movieDetail/detail',
      success(res) {
        console.log(22);
      }
    }
  }
});