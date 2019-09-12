'use strict';


async function downLoadTxt(ctx) {
    await ctx.render('downLoadTxt.ejs');
}

module.exports = {
    downLoadTxt
}