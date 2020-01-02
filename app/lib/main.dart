import 'package:flutter/material.dart';
import 'package:video_app/utils/request.dart';
import 'page/home.dart';

void main() {
  // 初始化请求模块
  HttpUtil();
  runApp(MyApp());
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
