const superagent = require('superagent');
/**
 * superagent 请求第三方网址的数据
 * 
 * @param {string} url 请求的网址
 */
async function superGetData(url) {
    try {
        const data = await superagent.get(url);
        return data;
    } catch (error) {
        console.log(error);
    }
    return
}

module.exports = {
    superGetData
}