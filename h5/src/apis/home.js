import request from '@/utils/request';

//今日热门电影
export const getHomeMovies = (data,config) => 
request({
    url: '/api/homeMovieList',
    method: 'get',
    data,
    headers: { ...config }
})