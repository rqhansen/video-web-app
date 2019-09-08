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
    [
      "@babel/preset-env",
      {
        modules: false
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
