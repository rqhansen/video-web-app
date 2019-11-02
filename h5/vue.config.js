const path = require('path');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const CompressionWebpackPlugin = require("compression-webpack-plugin");

function resolve (dir) {
  return path.join(__dirname, dir);
}
module.exports = {
  publicPath: '/',
  assetsDir: 'static',
  configureWebpack: config => {
    if (process.env.NODE_ENV === 'production') {
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
                }
           }
        }
      };
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
      .set('@', resolve('src'))
      .set('@styles',resolve('src/assets/styles'));
      config.module
        .rule('images')
          .use('url-loader')
              .loader('url-loader')
              .tap(options => Object.assign(options,{limit: 10240}))
  },
  css: {
    sourceMap: false,
    loaderOptions: {
      scss: {
        prependData: `@import "~@/assets/styles/mixin.scss";`
      }
    }
  },
  productionSourceMap: false,
  devServer: {
    port: 9090,
    hotOnly: true
  }
}