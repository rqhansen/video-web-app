import request from '@/utils/request';

export const search = (params) =>
request({
    url: '/api/search',
    method: 'post',
    data: params
})