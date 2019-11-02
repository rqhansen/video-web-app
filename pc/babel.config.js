module.exports = {
  presets: [
    [
      '@vue/app',
      {
        useBuiltIns: 'entry',
      }
    ],
    //配置element-ui的按需加载
    [
      "@babel/preset-env",
      {
        // useBuiltIns: 'entry',
        modules: false,
        "targets": {
          "browsers": ["> 1%", "last 4 versions", "not ie <= 8"]
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
