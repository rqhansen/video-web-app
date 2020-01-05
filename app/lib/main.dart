
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/redux/appState.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'page/home.dart';
import 'package:video_app/widgets/baseWidgets/loadingIndictor.dart';

void main() {
  // 初始化请求模块
  HttpUtil();
  /// 全局loading
  runApp(LoadingProvider(
      themeData: LoadingThemeData(
        backgroundColor: Colors.white,
        loadingSize: Size(Adapt.px(80.0),Adapt.px(80.0)),
        tapDismiss: false,
      ),
      loadingWidgetBuilder: (ctx,data) {
          return Loading();
      },
     /// 包装redux
      child:IndexPage(),
    ),
  );
}

/// 初始化Store
Store<AppState> initStore() {
  return Store<AppState>(appReducer,
    /// 可添加中间键
    /// Middleware
    initialState: AppState(
      showDropMenu: true
    ),
  ); 
}

class IndexPage extends StatelessWidget {
  final Store<AppState> store = initStore();
  @override
  Widget build(BuildContext context) {
    return GestureDetector( /// 点击空白处收起软键盘
        behavior: HitTestBehavior.translucent,
        onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: StoreProvider(
        store: store,
        child: StoreBuilder<AppState>(builder: (context,store) {
          return MaterialApp(
              title: "Rq's app of downLoading film",
              theme: ThemeData(
              primaryColor: Color.fromRGBO(16, 100, 146, 1),
              backgroundColor: Colors.white,
              fontFamily: 'Georgia',
              accentColor: Color.fromRGBO(16, 100, 146, 1),
              ),
              /// 去掉debuger
              debugShowCheckedModeBanner: false,
              home: Home(),
            );
        }),
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Rq's app of downLoading film",
//      theme: ThemeData(
//        primaryColor: Color.fromRGBO(16, 100, 146, 1),
//        backgroundColor: Colors.white,
//        fontFamily: 'Georgia',
//        accentColor: Color.fromRGBO(16, 100, 146, 1),
//      ),
//      // 去掉debuger
//      debugShowCheckedModeBanner: false,
//      home: Home(),
//    );
//  }
//}
