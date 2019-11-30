import request from '@/utils/request';

export const getMovieDetail = (data) =>
request({
    url: '/api/getMovieDetail',
    method: 'post',
    data
})

