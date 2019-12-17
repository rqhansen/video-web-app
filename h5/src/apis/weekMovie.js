import request from '@/utils/request';

export const getWeekMovies = ({loading}) => 
    request({
        url: '/api/weekMovie',
        method: 'get',
        headers: { loading }
    })