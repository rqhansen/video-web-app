import 'package:video_app/redux/mixinReducerWithAction/dropDownMenu.dart';

class AppState {
  /// 显示隐藏下拉菜单
  bool showDropMenu;

  AppState({
      this.showDropMenu
  });
}

/// 创建Reducer
/// 源码中Reducer是一个方法
/// typeof State Reducer<State>(State state,dynamic action);
/// 我们定义了appReducer 用于创建store

AppState appReducer(AppState state,action) {
  return AppState(
    /// 通过SwitchDropMenuReducer将AppState的showDropMenu和action关联
    showDropMenu: switchDropMenuReducer(state.showDropMenu,action)
  );
}

/// 步骤
/// 1. 先创建AppState
/// 2. 创建单个action，和单个action对应的reducer
/// 3. 将单个action和单个action对应的reducer先关联
/// 4. 将关联后的与AppState相关联



