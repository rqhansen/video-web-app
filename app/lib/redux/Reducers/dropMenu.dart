
/// 创建reducer，接受一个action,返回一个新的state来替换store中老的state,
/// 此处action为SwitchShowDropMenuAction类的实例，实例有一个showDropMenu属性

/// 切换显示下拉菜单
bool switchShowDropMenuReducer(bool showDropMenu, action) {
  showDropMenu = action.showDropMenu;
  return showDropMenu;
}


