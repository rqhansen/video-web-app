import request from '@/utils/request';

const CancelToken = request.CancelToken;

//今日热门电影
export const getHomeMovies = ({loading,context}) => 
request({
    url: '/api/homeMovieList',
    method: 'get',
    headers: { loading },
    cancelToken: new CancelToken(cancel => {
        context.cancel = cancel;
    })
})