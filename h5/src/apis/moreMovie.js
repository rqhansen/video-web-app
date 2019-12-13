import request from '@/utils/request';

export const getMoreMovie = ({loading}) => 
request({
    url: '/api/moreMovie',
    method: 'get',
    headers: { loading }

}) 