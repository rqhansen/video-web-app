import request from '@/utils/request';

export const getTypeMovie = (id: string) => 
    request({
        url: `/api/${id}/index`,
        method: 'get'
    })