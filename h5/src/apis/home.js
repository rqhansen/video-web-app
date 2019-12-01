import request from '@/utils/request';
import axios from 'axios'; 

//今日热门电影
export const getHomeMovies = ({loading,context}) => 
request({
    url: '/api/homeMovieList',
    method: 'get',
    headers: { loading },
    cancelToken: new axios.CancelToken(function executor(c) {
        if(!context) return;
        if(context.cancel) return;
        context.cancel = c;
    })
})