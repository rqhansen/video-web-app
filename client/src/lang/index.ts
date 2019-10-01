import Vue from 'vue'
import VueI18n from 'vue-i18n'

// element-ui 内置的语言包

// @ts-ignore
import elementEnLocale from 'element-ui/lib/locale/lang/en'
// @ts-ignore
import elementZhLocale from 'element-ui/lib/locale/lang/zh-CN'

// 项目本地定义的语言
import enLocal from './en'
import zhLocal from './zh'

Vue.use(VueI18n);

const messages = {
    en: {
        ...enLocal,
        ...elementEnLocale
    },
    zh: {
        ...zhLocal,
        ...elementZhLocale
    }
}

const i18n = new VueI18n({
    locale: 'en',
    messages
})

export default i18n;