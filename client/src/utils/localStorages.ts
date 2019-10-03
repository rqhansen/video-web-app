
const language = 'language';
export const getLanguage = () => localStorage.getItem('language');
export const setLanguage = (language: string) => localStorage.setItem('language',language);