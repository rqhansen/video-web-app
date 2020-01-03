
class AppState {
  /// 显示隐藏下拉菜单
  bool showDropMenu;

  AppState({
      this.showDropMenu
  });
}
/// 创建action
class SwitchShowDropMenuAction {
  bool showDropMenu;
  SwitchShowDropMenuAction(this.showDropMenu);
}


