
module.exports = {
    css: {
        loaderOptions: {
            sass: {
               prependData: `@import "@/style/scss/variables.scss";`
            }
        } 
    },
    chainWebpack: config => {
        config.module
            .rule('images')
                .use('url-loader')
                    .loader('url-loader')
                    .tap(options => Object.assign(options,{limit: 10240}))
    },
    // publicPath: process.env.NODE_ENV === 'production' ? '/client/' : ''
    publicPath: '/',
    outputDir: 'dist',
    productionSourceMap: false
}