
/// 切换显示dropMenu的action,构造函数带参数的好处：我再触发action的地方可以动态的传入数据，用起来更加的灵活。
class SwitchShowDropMenuAction {
  final bool showDropMenu;
  SwitchShowDropMenuAction(this.showDropMenu);
}

/// 如果需要从服务器获取数据

// class FetchShowDropMenu {

// }

//bool changeShowDropMenu(bool showDropMenu,action) {
//
//}