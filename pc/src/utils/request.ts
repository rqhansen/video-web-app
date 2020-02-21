import axios from 'axios';
import router from '../router';

const service = axios.create({
    // baseURL: '192.168.5.131',
    timeout: 6000
});

//添加请求拦截器
service.interceptors.request.use(config => {
    //在发送请求前做些什么
    const token = localStorage.getItem('token');
    if(token) {
        config.headers.common['token'] = token;
    } 
    return config;
},(error) => {
    //对请求错误做些什么
    return Promise.reject(error);
})

//添加相应拦截器
service.interceptors.response.use(response => {
    //对相应请求做些什么
    const data = response.data;
    if(data) {
        if(data.code === -1) { // 请求失败
            const {code:statusCode,message} = data.data;
            if(statusCode === 100) { // 登录凭证失效
                window['vm'].$confirm('登录凭证失效，请重新登录','请求提示',{
                    confirmButtonText: '确定',
                    cancelButtonText: '取消', 
                    showCancelButton: true,
                    customClass: 'confirm-dialog-wp',
                    type: 'error',
                }).then(async () => {
                    router.push('/admin-login');
                }).catch(() => {
                    // 取消或点击×关闭 code...
                })
            } else {
                window['vm'].$confirm(`${message}`,'请求提示',{
                    confirmButtonText: '确定',
                    cancelButtonText: '取消', 
                    showCancelButton: false,
                    customClass: 'confirm-dialog-wp',
                    type: 'error',
                }).then(async () => {
                    // 点击确定按钮code...
                }).catch(() => {
                    // 取消或点击×关闭 code...
                })
            }
        }
    }
    return response;
},(error) => {
    //对响应请求做些什么
    return Promise.reject(error);
})

export default service;

