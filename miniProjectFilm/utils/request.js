const host = require('../config/network.js');

let wxSessionValid = null; // 检查过

function request({ url, method, data, header, noLoading,isAuth}) {

  if (!noLoading) {
      wx.showLoading({
        title: "加载中..."
      });
  }
  

  return new Promise((resolve,reject) =>{
    wx.request({
      url: `${host}${url}`,
      data: data,
      header: header,
      method: method || 'GET',
      success(res) {
        resolve(res.data);
      },
      fail(res) {
        wx.showToast({
          title: '请求失败，请稍后重试...',
          type: 'error',
          icon: 'none'
        });
        resolve();
      },
      complete(res) {
        if(!noLoading) {
          wx.hideLoading();
        }
      }
    })
  })
}

module.exports = request