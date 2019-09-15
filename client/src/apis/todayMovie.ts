import request from '@/utils/request';

//今日最新电影
export const getTodayMovies = () => 
request({
    url: '/api/todayMovie',
    method: 'get'
})