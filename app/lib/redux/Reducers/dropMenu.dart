
/// 创建reducer

class  SwitchShowDropMenuReducer {
  static bool _switchShowDropMenu(bool showDropMenu, action) {
    showDropMenu = action.data;
    return showDropMenu;
  }
}
