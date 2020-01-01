import 'package:flutter/material.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'widgets/appBar.dart';
import 'page/home.dart';

//void main() => runApp(MyApp());
void main() {
  /// 初始化请求模块
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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(barHeight: Adapt.px(90),),
      body: Home()
    );
  }
}
