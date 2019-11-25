var docEl = document.documentElement;
var metaEl = document.querySelector('meta[name="viewport"]');
var dpr = window.devicePixelRatio || 1;
scale = 1 / dpr;
//设置viewport, 进行缩放，达到高清效果
metaEl.setAttribute(
    'content',
    'width=' + 
        dpr * docEl.clientWidth + 
        ',initial-scale=' + 
        scale + 
        ',maximum-scale=' +
        scale + 
        ',minimum-scale=' + 
        scale +
        ',user-scalable=no'
);

//设置data-dpr属性，留作css hack之用
docEl.setAttribute('data-dpr',dpr);
