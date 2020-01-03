
/// 创建reducer，接受一个action,返回一个新的state来替换store中老的state,

/// 切换显示下拉菜单
bool switchShowDropMenuReducer(bool showDropMenu, action) {
  showDropMenu = action.data;
  return showDropMenu;
}


