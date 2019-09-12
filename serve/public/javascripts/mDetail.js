//控制内容显示隐藏
(function () {
    let detail = selectEleById('detailContent');
    let ps = detail.getElementsByTagName('p');
    let goTop = selectEleById("goTop");
    let mainEle = selectEleById('main');
    let isPc = isPcAgent();
    Array.from(ps).forEach(el => {
        let span = el.children[1];
        if (!span.innerText) {
            addClassName(span.parentNode, 'hide');
        }
    })
    if(isPc) {
        addEvent(document,'scroll',throttle(isShowPcGoTop));
        function isShowPcGoTop() {
            let scrollTop = getScrollTop();
            if (scrollTop >= 300) {
                addClassName(goTop, 'show');
            } else {
                removeClassName(goTop, 'show');
            }
        }
    } else {
        mainEle.style.height='100vh';
        mainEle.style.webkitOverflowScrolling='touch';
        addEvent(mainEle,'scroll',throttle(isShowGoTop));
        function isShowGoTop() {
            let scrollTop = mainEle.scrollTop;
            if (scrollTop >= 300) {
                addClassName(goTop, 'show');
            } else {
                removeClassName(goTop, 'show');
            }
        } 
    }
    //是否显示加载中
    if(!isPc) {
        handleIsShowLoad();
    }

    function handleIsShowLoad() {
        let img = selectEleById('detailImg');
        if (img.complete) { //如果图片加载完成了
            return;
        }
        let loadWp = selectEleById('loadWp');
        addClassName(loadWp, 'show');
        addEvent(img,'load',hideLoad);
        addEvent(img,'error',hideLoad);
    }
    //隐藏加载中
    function hideLoad() {
        let loadWp = selectEleById('loadWp');
        removeClassName(loadWp, 'show');
    }

    //复制影片链接(pc和移动端)
    if(isPc) {
        copyMDetail('copyMDetail');
    } else {
        copyMDetail('mbCopyMDetail');
    }
    function copyMDetail(eleId) {
        let cBtn = selectEleById(eleId);
        addEvent(cBtn,'click',copyUrl);
    }
    function copyUrl() {
        let url = window.location.href;
        let flag = copyText(url);
        if (flag) {
            alert('网址已复制，可以分享给好友了!');
        }
    }
})();

