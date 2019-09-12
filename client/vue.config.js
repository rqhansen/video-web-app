const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

module.exports = {
    chainWebpack: config => {
        config.plugins.delete('prefetch');
        config.module
            .rule('images')
                .use('url-loader')
                    .loader('url-loader')
                    .tap(options => Object.assign(options,{limit: 10240}))
        config.
        plugin
        (
        'webpack-bundle-analyzer'
        ).use(BundleAnalyzerPlugin).end();
    },
    css: {
        loaderOptions: {
            sass: {
               prependData: `@import "@/styles/variables.scss";` //全局变量
            }
        } 
    },
    // publicPath: process.env.NODE_ENV === 'production' ? '/client/' : ''
    publicPath: '/',
    outputDir: 'dist',
    productionSourceMap: false,
    devServer: {
        publicPath: "/",
        host: "0.0.0.0",
        port: 8080,
        useLocalIp: true,
        proxy: {
          "/api": { //我的接口是'/client'开头的才使用代理
            target: 'http://localhost:82',
            changeOrigin: true,
            pathRewrite: {'^/api': '/api'},    //这里重写路径(接口路径里有api字段)
            // pathRewrite: {‘^/api’: '/'} //这里重写路径(接口路径里无api字段)
            // ws: false
          },
        //   "/socket": {
        //     target: "ws://192.168.5.131:80",
        //     changeOrigin: true
        //   }
        },
        open: "chrome",
        hotOnly: true
      },
}