import request from '@/utils/request';

export const getMovieDetail = (params: object) =>

request({
    url: '/api/getMovieDetail',
    method: 'post',
    data: params
})

