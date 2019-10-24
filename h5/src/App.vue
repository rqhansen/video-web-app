<template>
  <div id="app">
    万寻资源网
    <mt-button type="default">default</mt-button>
  </div>
</template>

<script>

export default {
  name: 'app',
}
</script>

<style lang="scss">
@import '~@styles/index.scss';
#app {
  width: 375px;
  margin-left: 40px;
  margin-top: 40px;
  height: 200px;
  padding-top: 20px;
  font-size: 30px;
  border: 1px solid black;
  border-radius: 20px;
  text-align: center;
}
img {
  content: normal !important;
}
</style>
