const request = require('../../utils/request.js');
const throttle = require('../../utils/throttle.js');
// const { search } = require('../../config/apis/getData.js');
const { navs } = require('../../config/nav.js');
//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    navs: navs,
    movies: [],
    currIndex: 0,
    toNavLeft: 0,
    hasFocus: false,
    showBottomLoading: false,
    windowWidth: 0,
    // scrollTop: 0,
    scrollTops: [],
    oldScrollTops:[],
    inputValue: '',
    historySearch: [],
    searchedMovie: '',
    scrollThrottle: ''
    // motto: 'Hello World',
    // userInfo: {},
    // hasUserInfo: false,
    // canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },

  // 监听滚动
  swiperItemScroll(e) {
    const { scrollTop } = e.detail;
    this.data.scrollThrottle(scrollTop);
  },

  
  setScrollTop() {
    this.data.oldScrollTops[this.data.currIndex] = arguments[0][0];
  },
  
  onLoad:  function () {
    this.data.scrollTops = new Array(navs.length).fill(0);
    this.data.oldSscrollTops = this.data.scrollTops.slice(0);
    this.data.scrollThrottle = throttle(this.setScrollTop);
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse){
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
    wx.getSystemInfo({
      success: (res) => {
        this.setData({
          windowWidth: res.windowWidth
        })
      },
    })       
    // 初始化首页数据
    this.initData();
  },

  initData: async function() {
    // const res = await getHomeData();
    const res = await request({url: '/api/homeMovieList'});
    if(!res) return;
    this.setMovieList(0,res.data.movies);
  },

  // 设置数据
  setMovieList(index,data) {
    if(!index) {
      this.data.movies[index] = data;
    } else {
      const typeMovie = (this.data.movies[index] && this.data.movies[index].typeMovies || []).concat(data.typeMovie);
      this.data.movies[index] = {
        typeMovies: typeMovie,
        page: data.page,
        total: data.total
      };
    }
    this.setData({
        movies: this.data.movies
    })
  },
  // 下拉刷新
  async onPullDownRefresh() {
    if (this.data.hasFocus) return;
    const currIndex = this.data.currIndex;
    const type = this.data.navs[currIndex].value;
    let result = await this.getData(type,currIndex ? 1 : undefined,true);
    if(currIndex) {
      result = Object.assign({}, result, { page: 1 });
    }
    wx.stopPullDownRefresh();
    if(!currIndex) {
      this.data.movies[currIndex] = result;
    } else {
      this.data.movies[currIndex] = {
        typeMovies: result.typeMovie,
        page: 1,
        total: result.total
      };
    }
    this.data.scrollTops[this.data.currIndex] = 0;
    this.setData({
      movies: this.data.movies,
      scrollTops: this.data.scrollTops
    });
  },

  // 请求数据
  async getData(type,page,noLoading) {
    let result = '';
    if (!type) {
      const { data: { movies } } = await request({ url: '/api/homeMovieList',noLoading: true });
      result = movies;

    } else {
      const { data } = await request({
        url: '/api/typeMovie',
        method: 'POST',
        data: {
          page: page,
          type: type
        },
        noLoading:noLoading
      });
      result = data;
      // result = await getTypeMovie({
      //   page: page,
      //   type: type
      // }, undefined, noLoading);
    }
    return result;
  },

  // 滚动到底部
  async scrolltolower(e) {
    const currIndex = this.data.currIndex;
    if (!currIndex) return;
    const currMovie = this.data.movies[currIndex];
    if (currMovie && currMovie.typeMovies.length >= currMovie.total) {
      return;
    }
    this.setData({
      showBottomLoading: true
    });
    const type = this.data.navs[currIndex].value;
    let page = currMovie && currMovie.page || 1 ;
    let result = await this.getData(type, ++page,true);
    this.setData({
      showBottomLoading: false
    });
    if(!result) return;
    if(currIndex) {
      result = Object.assign({},result,{page: page});
    }
    this.setMovieList(currIndex, result);
  },

  // 点击tabbar
  switchTab: function(e) {
    const { currentTarget } = e;
    const clickedIndex = currentTarget.dataset['index'];
    this.setHandleMovie(clickedIndex);
  },

  // 滑动轮播
  swipeList:function(event) {
    const { current } = event.detail;
    this.setHandleMovie(current);
  },

  async setHandleMovie(tabIndex) {
    if (!this.data.movies[tabIndex]) {
      const type = this.data.navs[tabIndex].value;
      const result = await this.getData(type, tabIndex ? 1 : undefined);
      this.setMovieList(tabIndex, result);
    }
    this.data.scrollTops[this.data.currIndex]= this.data.oldScrollTops[this.data.currIndex],
    this.setData({
      scrollTops: this.data.scrollTops,
      currIndex: tabIndex,
      toNavLeft: (this.data.windowWidth / 5) * (tabIndex - 3)
    });
  },

  // 输入框获得焦点
  bindFocus: function () {
    this.setData({
      hasFocus: true
    });
    // 获取历史搜索
    const movieNames = this.getHistorySearch();
    this.setData({
      historySearch: movieNames
    });
  },
  getHistorySearch() {
    var names = wx.getStorageSync('sMovies') || [];
    return names;
  },
  // 清空历史搜索
  clearHistory() {
    wx.setStorageSync('sMovies',[]);
    this.setData({
      historySearch: []
    });
  },
  // input输入中
  input(e) {
    const value = e.detail.value;
    this.setData({
      inputValue: value
    });
  },
  //搜索
  async searchMovie(e) {
    let searchName = this.data.inputValue;
    const sName = e.currentTarget.dataset.sName;
    if (sName) {
      searchName = sName;
    } else {
      let searchs = new Set(this.data.historySearch);
      searchs.add(searchName);
      this.data.historySearch = Array.from(searchs);
    }
    wx.setStorageSync('sMovies', this.data.historySearch);
    const { data } = await request({url: '/api/search',method: 'POST',data: { keyword: searchName,page: 1}});
    const res = data.movies[0];
    !sName && this.deleInputValue();
    this.setData({
      searchedMovie: res === undefined ? [] : [res]
    });
    
  },

  // 清空输入框
  deleInputValue() {
    this.setData({
      inputValue: ''
    });
  },
  // 隐藏搜索层
  cancel() {
    this.setData({
      hasFocus: false,
      inputValue: '',
      searchedMovie: ''
    });
  },
  // 去电影详情
  goMovieDetail(event) {
    const { currentTarget: { dataset: { id,type } } } = event;
    this.setData({
      inputValue: ''
    }); 
    wx.navigateTo({
      url: `/pages/movieDetail/detail?id=${id}&movieType=${type}`,
    })
  }
  // getUserInfo: function(e) {
  //   console.log(e)
  //   app.globalData.userInfo = e.detail.userInfo
  //   this.setData({
  //     userInfo: e.detail.userInfo,
  //     hasUserInfo: true
  //   })
  // }
})

