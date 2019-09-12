(function () {

    let isPc = isPcAgent();
    let goTop = selectEleById("goTop");
    let mainEle = selectEleById('main');
    let lazyImgs = Array.from(selectElesByClassName('lazyImg',mainEle));
    if(isPc) {
        lazyImgs.forEach(item =>{
            item.src = item.getAttribute('data-src');
            item.removeAttribute('data-src');
        })
        addEvent(document,'scroll',throttle(issShowPcGoTop));
        function issShowPcGoTop() {
        let scrollTop = getScrollTop();
        if (scrollTop >= 300) {
            addClassName(goTop, 'show');
        } else {
            removeClassName(goTop, 'show');
        }
        }
        return;
    } 

    let clientHeight = getClientSize().height;
    mainEle.style.height='100vh';
    mainEle.style.webkitOverflowScrolling='touch';
    //首次加载页面判断哪些图片可以加载
    loadImgs();
    addEvent(mainEle,'scroll',throttle(isShowGoTop));
    function isShowGoTop() {
        let scrollTop = mainEle.scrollTop;
        if (scrollTop >= 300) {
            addClassName(goTop, 'show');
        } else {
            removeClassName(goTop, 'show');
        }
        //处理加载图片
        loadImgs();
        //初始化后过滤已经加载的图片
        lazyImgs = lazyImgs.filter(item =>item.hasAttribute('data-src'));
    }

    //判断图片位置
    function loadImgs() {
        for(let i = 0,len = lazyImgs.length; i<len; i++) {
            let img = lazyImgs[i];
            let isLoad = isLoadImg(img);
            if(!isLoad) continue;
            img.src = img.getAttribute('data-src');
            img.removeAttribute('data-src');
        }
    }
    //是否可以加载图片了
    function isLoadImg(img) {
        if(!img.hasAttribute('data-src')) {
          return false;
        }
        let top = img.getBoundingClientRect().top;
        if(top >= clientHeight) {
          return false;
        }
        return true;
      }
})();