import request from '@/utils/request';

//今日热门电影
export const getIndexMovieList = () => 
request({
    url: '/api/homeMovieList',
    method: 'get'
})
