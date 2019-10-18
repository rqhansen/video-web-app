const path = require('path');
function resolve (dir) {
  return path.join(__dirname, dir);
}
module.exports = {
  assetsDir: 'static',
  productionSourceMap: false,
  devServer: {
    port: 9090
  },
  chainWebpack: config => {
    config.resolve.alias
      .set('@', resolve('src'))
  }
}