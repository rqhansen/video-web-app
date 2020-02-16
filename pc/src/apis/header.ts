import request from '@/utils/request';

//获取热门电影
export const getHotMovie = (params: any) => {
    request({
        url: '/hotMovie'
    })
}
