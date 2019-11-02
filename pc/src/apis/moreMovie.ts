import request from '@/utils/request';

export const getMoreMovie = () => 
    request({
        url: '/api/moreMovie',
        method: 'get'
    }) 