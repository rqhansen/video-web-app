module.exports = {
  presets: [
    [
      '@vue/app',
      {
        polyfills: [
          'es6.promise'
        ]
      }
    ],
    //配置element-ui的按需加载
    [
      "@babel/preset-env",
      {
        modules: false,
        "targets": {
          "browsers": ["> 1%", "last 2 versions", "not ie <= 8"]
        }
      }
    ]
  ],
  plugins: [
    [
      "component",
      {
        "libraryName": "element-ui",
        "styleLibraryName": "theme-chalk"
      }
    ]
  ]
}
