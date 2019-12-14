import Vue from 'vue';

const requireComponent = require.context('../baseComponents',false,/\w+\.vue$/);
requireComponent.keys().forEach(fileName => {
    const componentConfig = requireComponent(fileName);
    let componentName = fileName
        .split('/')
        .pop()
        .replace(/\.\w+$/,'');
    const nName = componentName[0].toUpperCase() + componentName.slice(1);
    Vue.component(nName,componentConfig.default || componentConfig);
})