import request from '@/utils/request';

export const getMovieDetail = (data,config) =>
request({
    url: '/api/getMovieDetail',
    method: 'post',
    data,
    headers: { ...config }
})

