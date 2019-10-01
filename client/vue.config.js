const path = require('path');
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const CompressionWebpackPlugin = require("compression-webpack-plugin");

function resolve (dir) {
    return path.join(__dirname, dir)
}

module.exports = {
    publicPath:'/', //history模式时配置
    outputDir: 'dist',
    assetsDir: './static',
    //configureWebpack配置
    configureWebpack: config => {
        if(process.env.NODE_ENV === 'production') {
            config.optimization = {
                splitChunks: {
                    cacheGroups: {
                        vendors: {
                            name: `chunk-vendors`,
                            test: /[\\/]node_modules[\\/]/,
                            priority: -10,
                            chunks: 'async'
                        },
                        common: {
                            name: `chunk-common`,
                            minChunks: 2,
                            priority: -20,
                            chunks: 'async',
                            reuseExistingChunk: true
                        },
                        // newsdk: {
                        //     name: 'new-sdk-config',
                        //     test: /new-sdk/,  // src 项目下的文件夹，对该文件jia
                        //     minChunks: 1,
                        //     minSize: 0,
                        //     chunks: 'async',
                        //     priority: 60,
                        //     reuseExistingChunk: true
                        // }
                   }
                }
            }
            //开启gzip压缩
            config.plugins.push(new CompressionWebpackPlugin({
                test: /\.js$|\.html$|\.css/,
                threshold:10240,
                deleteOriginalAssets: true // 删除原文件
            }))
            //去掉debugger
            config.plugins.push(
                new UglifyJsPlugin({
                    uglifyOptions: {
                        compress: {
                            drop_debugger: true,
                            drop_console: true,
                            pure_funcs: ['console.log']
                        }
                    },
                    sourceMap: false,
                    // parallel: true
                })
            ); 
        }
    },
    chainWebpack: config => {
        config.plugins.delete('prefetch');
        config.plugins.delete('preload');

        // //压缩代码
        config.optimization.minimize(true);
        // //分割代码
        config.optimization.splitChunks({
            chunks: 'all'
        });
        config.resolve.alias
            .set('@',resolve('src'))
            .set('@js',resolve('src/assets/js'))
            .set('@imgs',resolve('src/assets/images'))
            .set('@styles',resolve('src/assets/styles'))
            .set('@components',resolve('src/views/components'))
        config.module
            .rule('images')
                .use('url-loader')
                    .loader('url-loader')
                    .tap(options => Object.assign(options,{limit: 10240}))
                    //
        config.plugin('webpack-bundle-analyzer').use(BundleAnalyzerPlugin).end();
    },
    css: {
        sourceMap: false,
        loaderOptions: {
            sass: {
               prependData: `@import "@/assets/styles/mixin.scss";` //全局变量
            }
        },
        modules: false 
    },
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
          }
        },
        open: "chrome",
        hotOnly: true,
        compress: false,
        overlay: {
            warnings: true,
            errors: true
        }
      },
}