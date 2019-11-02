import request from '@/utils/request';

export const getTypeMovie = (params: object) => 
    request({
        url: `/api/typeMovie`,
        method: 'post',
        data: params
    })