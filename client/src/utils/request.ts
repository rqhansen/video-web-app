import axios from 'axios';

const service = axios.create({
    // baseURL: '192.168.5.131',
    timeout: 5000
});

//添加请求拦截器
service.interceptors.request.use(config => {
    //在发送请求前做些什么
    return config;
},(error) => {
    //对请求错误做些什么
    return Promise.reject(error);
})

//添加相应拦截器
service.interceptors.response.use(response => {
    //对相应请求做些什么
    return response;
},(error) => {
    //对响应请求做些什么
    return Promise.reject(error);
})

export default service;

