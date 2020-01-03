import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/redux/appState.dart';
import 'package:video_app/utils/request.dart';
import 'page/home.dart';

void main() {
  // 初始化请求模块
  HttpUtil();
  runApp(MyApp());
}

/// 初始化Store
Store<AppState> initStore() {
  return Store<AppState>(appReducer,
    // 可添加中间键
    /// Middleware
    initialState: AppState(
      showDropMenu: false
    )
  ); 
}

class IndexPage extends StatelessWidget {
  final Store<AppState> store = initStore();
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
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
          // 去掉debuger
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rq's app of downLoading film",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(16, 100, 146, 1),
        backgroundColor: Colors.white,
        fontFamily: 'Georgia',
        accentColor: Color.fromRGBO(16, 100, 146, 1),
      ),
      // 去掉debuger
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
