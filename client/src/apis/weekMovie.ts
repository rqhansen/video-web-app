import request from '@/utils/request';

export const getWeekMovies = () => 
    request({
        url: '/api/weekMovie',
        method: 'get'
    })