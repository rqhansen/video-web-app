import axios from 'axios';
import { Indicator } from 'mint-ui';

const service = axios.create({
    // baseURL: '192.168.5.131',
    timeout: 10000
});

//添加请求拦截器
service.interceptors.request.use(config => {
    const { headers: { loading } } = config;
    if(loading === undefined) {
        Indicator.open('加载中...');
    }
    //在发送请求前做些什么
    return config;
},(error) => {
    //对请求错误做些什么
    return Promise.reject(error);
})

//添加相应拦截器
service.interceptors.response.use(response => {
    //对相应请求做些什么
    const { config: { headers: { loading } } } = response;
    if(loading === undefined) {
        Indicator.close();
    }
    // Indicator.close();
    return response;
},(error) => {
    //对响应请求做些什么
    return Promise.reject(error);
})

export default service;

