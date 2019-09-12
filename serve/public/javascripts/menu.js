
(function () {
    let menuWp = selectEleById('menuWp');
    addEvent(menuWp, 'click', clickMenu);
    function clickMenu(e) {
        if (!hasClassName(e.target, 'work')) {
            return;
        }
        handleTypeMovie(e);
    }
    /**
     * 处理不同的电影类型事件
     */
    function handleTypeMovie(e) {
        // let [val, url] = [e.target.innerHTML, '/html'];
        let val = e.target.innerHTML;
        let url = '/html';
        switch (val) {
            case '首页':
                url = '/';
                break;
            case '动作片':
                url += '/action/index';
                break;
            case '喜剧片':
                url += '/comedy/index';
                break;
            case '爱情片':
                url += '/romance/index';
                break;
            case '科幻片':
                url += '/science/index';
                break;
            case '剧情片':
                url += '/drama/index';
                break;
            case '悬疑片':
                url += '/suspense/index';
                break;
            case '战争片':
                url += '/war/index';
                break;
            case '惊悚片':
                url += '/thrill/index';
                break;
            case '恐怖片':
                url += '/horror/index';
                break;
            case '灾难片':
                url += '/disaster/index';
                break;
            case '动画片':
                url += '/cartoon/index';
                break;
            default:
                break;
        }
        window.open(url, '_self');
    }
})();

