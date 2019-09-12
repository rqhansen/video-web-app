
(function () {

  let wp = selectEleById('menuWp');
  let menuIcon = selectEleById('menuIcon');
  let indexNav = selectEleById('indexNav');
  let addSave = selectEleById('addSave');
  let rightSearch = selectEleById('rightSearch');
  let goTop = selectEleById("goTop");
  let mainEle = selectEleById('main');
  let footer = selectEleById('footer');
  let menus = selectElesByClassName('work', wp);
  let rightBtn = selectElesByClassName('btn', rightSearch)[0];
  let navBtn = selectElesByClassName('btn', indexNav)[0];
  let isPc = isPcAgent(); //判断是否为Pc

  if (!isPc) { //Pc端展示页脚
    footer.style.display = 'none';
  }

  /**
   * 添加收藏
   */
  addEvent(addSave, 'click', addSaveEvent);
  function addSaveEvent(e) {
    stopDefault(e);
    alert("请使用Ctrl+D进行添加");
  }

  /**
   * 小屏下切换显示下拉导航
   */
  addEvent(menuIcon, 'click', setNavDisplay);
  function setNavDisplay() {
    toggleClassName(indexNav, 'sm-nav');
    toggleClassName(menuIcon, 'active');
  }

  // active的menu
  setActiveNav();
  function setActiveNav() {
    let url = window.location.href;
    if (!url.includes('html')) {
      if (url.includes('search')) { //搜索页
        return;
      }
      let target = selectElesByClassName('home', wp)[0]; //首页
      addClassName(target, 'active');
      return;
    }
    let splitUrl = url.split('/');
    let lastUrlSplit = splitUrl[5];
    if (lastUrlSplit !== 'index') { //电影详情页
      return;
    }
    let movieType = splitUrl[4];
    let activeIndex;
    switch (movieType) {
      case 'action':
        activeIndex = 1;
        break;
      case 'comedy':
        activeIndex = 2;
        break;
      case 'romance':
        activeIndex = 3;
        break;
      case 'science':
        activeIndex = 4;
        break;
      case 'drama':
        activeIndex = 5;
        break;
      case 'suspense':
        activeIndex = 6;
        break;
      case 'war':
        activeIndex = 7;
        break;
      case 'thrill':
        activeIndex = 8;
        break;
      case 'horror':
        activeIndex = 9;
        break;
      case 'disaster':
        activeIndex = 10;
        break;
      case 'cartoon':
        activeIndex = 11;
        break;
      case 'tv':
        activeIndex = 12;
        break;
      case undefined:
        activeIndex = 0;
        break;
      default:
        activeIndex = -1;
    }
    if (activeIndex === -1) {
      return;
    }
    addClassName(menus[activeIndex], 'active');
  }

  /**
   *绑定浏览器窗口改变触发的事件
   */
  windowResizeEvent(() => {
    let width = getClientSize().width; //获取浏览器文档区域的宽度
    if (width > 767) {
      removeClassName(indexNav, 'sm-nav');
      removeClassName(menuIcon, 'active');
    }
  });

  if (isPc) {  //PC搜索框回车事件
    iptKeyUp();
    function iptKeyUp() {
      let ipt = selectElesByClassName('ipt', rightSearch)[0];
      addEvent(ipt, 'keyup', keyUpEvent);
    }
    function keyUpEvent(e) {
      let event = getEvent(e);
      let key = getKeyCode(event);
      if (key === 13) {
        handleRightSearch();
      }
    }
    //点击搜索事件
    addEvent(rightBtn, 'click', handleRightSearch);
    function handleRightSearch() {
      let normalIpt = selectElesByClassName('ipt', rightSearch)[0];
      openSearch(normalIpt);
    }
  } else {
    addEvent(navBtn, 'click', handleNavSearch);
    function handleNavSearch() {
      let smIpt = selectElesByClassName('ipt', indexNav)[0]
      openSearch(smIpt);
    }
  }

  //搜索框触发的事件
  function openSearch(ele) {
    let value = ele.value;
    if (!value) return;
    window.open(`/plus/search?keyword=${value}&page=1`);
  }

  //回顶部事件
  addEvent(goTop, 'click', scrollToTop);
  function scrollToTop() {
    if (isPc) {
      if (document.documentElement.scrollTop) { //兼容IE
        window.goTopTimer = setInterval(() => {
          let documentTop = document.documentElement.scrollTop;
          document.documentElement.scrollTop = documentTop - 100;
          if (document.documentElement.scrollTop <= 0) {
            clearInterval(window.goTopTimer);
          }
        }, 18);
      } else if (document.body.scrollTop) {
        window.goTopTimer = setInterval(() => {
          let bodyTop = document.body.scrollTop;
          document.body.scrollTop = bodyTop - 100;
          if (document.body.scrollTop <= 0) {
            clearInterval(window.goTopTimer);
          }
        }, 18)
      }
    } else {
      window.goTopTimer = setInterval(() => {
        mainEle.scrollTop -= 100;
        if (mainEle.scrollTop <= 0) {
          clearInterval(window.goTopTimer);
        }
      }, 18)
    }
  }
})();
