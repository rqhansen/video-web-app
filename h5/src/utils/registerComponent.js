import Vue from 'vue';

const requireComponent = require.context('../baseComponents',false,/\w+\.vue$/);
requireComponent.keys().forEach(fileName => {
    const componentConfig = requireComponent(fileName);
    let componentName = fileName
        .split('/')
        .pop()
        .replace(/\.\w+$/,'')
        .replace(/\b\w+\b/,(word) => {
            return word.substring(0,1).toUpperCase() + word.substring(1);
        });
    Vue.component(componentName,componentConfig.default || componentConfig);
})