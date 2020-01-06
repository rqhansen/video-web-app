import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/constant/Colors.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Adapt.px(24.0),vertical: Adapt.px(20.0)),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).primaryColor,width:Adapt.onePx(),),
        )
      ),
      child: Column(
        children: <Widget>[
          DefaultTextStyle(
            style: TextStyle(
              color: CustomColors.tinyText,
              fontSize: Adapt.px(24.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Copyright © 2019',),
                GestureDetector(
                  child: Text('万寻资源网',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: Adapt.px(24.0)),textAlign: TextAlign.center,),
                  onTap: () {
                    var routeName = ModalRoute.of(context).settings.name;
                    if(routeName == '/') {
                      return;
                    }
                    Navigator.pushNamed(context, '/');
                  },
                ),
                Text('Powered by wx520.net'),
              ],
            ),
          ),
//          Text.rich(
//            TextSpan(
//              children: [
//                TextSpan(text: 'Copyright © 2019',),
//                TextSpan(
//                  text: '万寻资源网',
//                  style: TextStyle(color: Theme.of(context).primaryColor,),
//                ),
//                TextSpan(text: 'Powered by wx520.net',),
//              ],
//            ),
//            style: TextStyle(
//              color: CustomColors.tinyText,
//              fontSize: Adapt.px(24.0)
//            ),
//          ),
          Text(
            '本站所有内容均来自互联网，我们不提供影片资源存储、录制和上传！请下载后24小时内删除，不可用于商业传播，否则产生的一切后果将由您自己承担！',
            style: TextStyle(color: CustomColors.tinyText,fontSize: Adapt.px(24.0)),
            textAlign: TextAlign.center,
            strutStyle: StrutStyle(
              height: 1.4,
            ),
          ),
        ],
      )
    );
  }
}