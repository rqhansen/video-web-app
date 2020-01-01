import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.only(left: Adapt.px(24.0),right: Adapt.px(24.0)),
      padding: EdgeInsets.symmetric(horizontal: Adapt.px(24.0),vertical: Adapt.px(20.0)),
      child: Column(
        children: <Widget>[
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: 'Copyright © 2019',
                style: TextStyle(color: Color.fromRGBO(102, 102,102, 1),fontSize: Adapt.px(24.0),),
              ),
              TextSpan(
                text: '万寻资源网',
                style: TextStyle(
                  color: Color.fromRGBO(16, 100, 146, 1), fontSize: Adapt.px(24.0)
                ),
              ),
              TextSpan(
                text: 'Powered by wx520.net',
                style: TextStyle(color: Color.fromRGBO(102, 102,102, 1),fontSize: Adapt.px(24.0)),
              ),
            ]
          )),
          Text('本站所有内容均来自互联网，我们不提供影片资源存储、录制和上传！请下载后24小时内删除，不可用于商业传播，否则产生的一切后果将由您自己承担！',
                style: TextStyle(color: Color.fromRGBO(102, 102,102, 1),fontSize: Adapt.px(24.0)),
                strutStyle: StrutStyle(
                  height: 1.4
                ),)
        ],
      )
    );
  }
}