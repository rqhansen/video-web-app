
(function () {
    let isPc = isPcAgent();
    let mainEle = selectEleById('main');
    if (isPc) {
        addEvent(document, 'scroll', throttle(issShowPcGoTop));
        function issShowPcGoTop() {
            let scrollTop = getScrollTop();
            if (scrollTop >= 300) {
                addClassName(goTop, 'show');
            } else {
                removeClassName(goTop, 'show');
            }
        }
    } else {
        addEvent(mainEle, 'scroll', throttle(isShowGoTop));
        function isShowGoTop() {
            let scrollTop = mainEle.scrollTop;
            if (scrollTop >= 300) {
                addClassName(goTop, 'show');
            } else {
                removeClassName(goTop, 'show');
            }
        }
    }
    //总页数
    let total = Math.ceil(+selectEleById('totalPage').innerHTML / 10);
    if (!total) return;
    //分页容器
    let pageWp = selectEleById('pageIndexWp');
    //首页
    let first = selectElesByClassName('first', pageWp)[0];
    //上一页
    let prePage = selectElesByClassName('page-pre', pageWp)[0];
    //第n页至第n+10页
    let pages = selectElesByClassName('page', pageWp);
    //下一页
    let next = selectElesByClassName('page-next', pageWp)[0];
    //末页
    let last = selectElesByClassName('end', pageWp)[0];
    //获取当前页数
    let [keyword, currPage] = getCurrPage();
    //初始化
    if (currPage === 1) { //首页
        initOtherPage();
    } else { //非首页
        handleOtherPage();
    }

    //添加点击事件
    pageWp.addEventListener('click', (e) => {
        handleClickEvent(e);
    }, false);

    /**
     * 处理点击事件
     */
    function handleClickEvent(e) {
        stopDefault(e);
        let el = e.target;
        let parent = el.parentNode;
        let url;
        if (hasClassName(parent, 'first')) { //首页
            if (hasClassName(parent, 'disable')) return;
            url = `/plus/search?keyword=${keyword}&page=1`;
        } else if (hasClassName(parent, 'page-pre')) { //上一页
            if (currPage == 1) return;
            url = `/plus/search?keyword=${keyword}&page=${currPage - 1}`;
        } else if (hasClassName(parent, 'page')) { //第n页到第n+10页
            if (hasClassName(parent, 'active')) return;
            let page = el.innerHTML;
            url = `/plus/search?keyword=${keyword}&page=${page}`;
        } else if (hasClassName(parent, 'page-next')) { //下一页
            url = `/plus/search?keyword=${keyword}&page=${currPage + 1}`;
        } else if (hasClassName(parent, 'end')) { //末页
            if (currPage == total) return;
            url = `/plus/search?keyword=${keyword}&page=${total}`;
        }
        window.open(url, '_self');
    }

    /**
     * 当前为首页时，设置其它页面
     */
    function initOtherPage() {
        addClassName(prePage, 'hide');
        addClassName(first, 'disable');
        addClassName(prePage.nextElementSibling, 'active');
        handleOtherPage();
    }

    /**
     * 当前非首页时处理其它页面
     */
    function handleOtherPage() {
        let startPage = 1;
        let endPage = 11;
        if (currPage >= 11) {
            startPage = currPage - 5;
            endPage = currPage + 5;
            if (endPage > total) {
                endPage = total;
            }
        }
        for (let i = 0; i < pages.length; i++) {
            let pageEle = pages[i];
            let newPage = startPage + i;
            if (newPage === total) {
                addClassName(next, 'hide');
                addClassName(last, 'disable');
            } else if (newPage > total) {
                newPage = '';
            }
            // debugger;
            pageEle.children[0].innerHTML = newPage;
            pageEle.children[0].href = `/plus/search?keyword=${keyword}&page=${newPage}`;
            // //如果是当前页
            if (newPage === currPage) {
                addClassName(pageEle, 'active');
            }
            // //如果当前页不是末页
            if (currPage < total) {
                removeClassName(last, 'disable');
                removeClassName(next, 'hide');
            }
        }
    }
    /**
     * 获取当前页数和关键词
     */
    function getCurrPage() {
        let url = window.location.href;
        let urlSplits = url.split('?')[1];
        let querySplit = urlSplits.split("&");
        let keyword = querySplit[0].split('=')[1];
        let currPage = querySplit[1].split('=')[1] * 1;
        return [keyword, currPage];
    }
})();
