import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/titleBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _onRefresh,
        child: Container(
            child: Column(
            children: <Widget>[
              TitleBar(headTitle: '今日热门电影推荐', actionTitle: '更多'),
              Expanded(
                 child: ListView.builder(
                     itemCount: 100,
                     itemBuilder: (BuildContext context, int index) {
                       return ListTile(
                         title: Text('hha'),
                       );
                     }),
               ),
            ],
            )),
    );
  }

  Future<void>_onRefresh() async{
      return Future.delayed(Duration(milliseconds: 3200));
  }
}
