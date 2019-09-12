

module.exports.getNotFind = async function(ctx) {
    await ctx.render('notFind',{title:'页面找不到了'})
}