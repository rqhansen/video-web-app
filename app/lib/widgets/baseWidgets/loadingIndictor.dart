import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_app/utils/adapt.dart';

/// 自定义loading
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Adapt.px(160.0),
        height: Adapt.px(160.0),
        padding: EdgeInsets.only(top: Adapt.px(22.0)),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, .5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CupertinoActivityIndicator(
                radius: Adapt.px(30),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: Adapt.px(10.0)),
                child: Text('加载中...',textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.white,
                  fontSize: Adapt.px(26.0),
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}