import request from '@/utils/request';

export const search = (params: object) =>

request({
    url: '/api/search',
    method: 'post',
    data: params
})