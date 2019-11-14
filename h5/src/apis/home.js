import request from '@/utils/request';

//今日热门电影
export const getHomeMovies = () => 
request({
    url: '/api/homeMovieList',
    method: 'get'
})