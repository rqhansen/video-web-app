import request from '@/utils/request';

export const getTypeMovie = (params) => 
    request({
        url: `/api/typeMovie`,
        method: 'post',
        data: params
    })