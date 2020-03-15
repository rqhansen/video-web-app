
/**
 * 用户登录
 */
function login() {
  wx.showLoading({
    title: '加载中...'
  });
  return new Promise((resolve,reject) =>{
    wx.login({
      async success(res) {
        const { code } = res;
        wx.request({
          url: "http://localhost:82/api/codeToGetSession",
          method: "POST",
          data: { code },
          success(res) {
            resolve(res.data);
          },
          fail(res) {
            showToast();
            resolve();
          },
          complete(res) {
            wx.hideLoading();
          }
        });
      }
    })
  })
}

function showToast() {
  wx.showToast({
    title: '登录失败,请稍后重试...',
    type: "error",
    icon: "none"
  })
}

module.exports = login;