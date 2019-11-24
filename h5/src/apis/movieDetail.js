import request from '@/utils/request';

export const getMovieDetail = (params) =>

request({
    url: '/api/getMovieDetail',
    method: 'post',
    data: params
})

