'use strict';
const { thurderUrl } = require('../config/index');


async function downLoadThurder(ctx) {
    await ctx.render('downLoadThurder.ejs');
}

module.exports = {
    downLoadThurder
}