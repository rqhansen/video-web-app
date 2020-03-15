Page({
  data: {
      cacheSize: 0
  },
  onLoad() {
    const { currentSize,keys } = wx.getStorageInfoSync();
    this.setData({
      cacheSize: currentSize
    });
  },
  clearCache() {
    wx.clearStorageSync();
    this.setData({
      cacheSize: 0
    },() =>{
      wx.showToast({
        title: '清除成功',
      })
    });
  }
})