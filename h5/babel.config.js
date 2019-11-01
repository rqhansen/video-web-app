module.exports = {
  presets: [
    [
      '@vue/app',{
        useBuiltIns: 'entry'
      }
    ]
  ],
  plugins: [
    [
      "component",
      {
        "libraryName": "mint-ui",
        "style": true
      }
    ]

  ]
  // presets: [
  //   '@vue/cli-plugin-babel/preset'
  // ]
}
