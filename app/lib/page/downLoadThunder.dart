import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_app/constant/netConfig.dart';
import 'dart:io';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/widgets/baseWidgets/tapTextAnimateWidget.dart';
import 'package:video_app/widgets/baseWidgets/tapAnimateWidget.dart';
import 'package:video_app/widgets/baseWidgets/alertDialog.dart';

class DownLoadThunder extends StatelessWidget {



  /// 获取下载路径
  Future<String> getDownLoadPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path;
    return path;
  }

  /// 获取权限状态
  Future<PermissionStatus> getPermissionStatus () async{
    /// 申请权限
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    ///申请结果
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    return permission;
  }
  /// 下载
  void downLoad(BuildContext context) async{
    if(Platform.isAndroid !=true) {
      CustomAlertDialog.showAlertDialog(context);
      return;
    }
    PermissionStatus status = await getPermissionStatus();
    if(status == PermissionStatus.granted) {
      var downLoadPath = await getDownLoadPath();
      HttpUtil httpClient = HttpUtil.getInstance();
      var res = await httpClient.download('${NetConfig.baseUrl}/common/files/xunlei5.apk', '$downLoadPath/xunlei.apk');
      print(res);
    } else {
      //权限申请拒绝
      Fluttertoast.showToast(msg: '请开启存储权限');
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(barHeight: Adapt.px(90.0)),
      body: Container(
        decoration: BoxDecoration(color: Colors.white,),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: Adapt.px(84.0),
                padding: EdgeInsets.symmetric(horizontal: Adapt.px(16.0),),
                margin: EdgeInsets.only(bottom: Adapt.px(15.0),),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: Adapt.onePx(),color: Color.fromRGBO(236, 236, 236, 1),style: BorderStyle.solid),
                  )
                ),
                child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: Adapt.px(32.0),
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/xunlei_icon.jpg',width: Adapt.px(60.0),height: Adapt.px(60.0),),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Adapt.px(10.0),),
                          child: Text('迅雷5官方无限下载'),
                        ),
                        TapTextAnimateWidget(
                          textColor: Theme.of(context).primaryColor,
                          child: Text('查看教程',style: TextStyle(fontSize: Adapt.px(32.0)),),
                          onTap: () {},
                        )
                      ],
                    ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Adapt.px(16.0),top: Adapt.px(10.0),),
                child: Column(
                  children: <Widget>[
                    downLoadList('迅雷5安卓APK下载',() {
                      downLoad(context);
                    }),
                  ],
                ),
              )

            ],
        ),
      ),
    );
  }

  Widget downLoadList(String title,Function downLoad) {
    return TapAnimateWidget(
      initColor: Color.fromRGBO(81, 147, 199, 1),
      tapDownColor: Color.fromRGBO(81, 147, 199, .9),
      child: Container(
        width: Adapt.px(532.0),
        height: Adapt.px(124.0),
        padding: EdgeInsets.only(left: Adapt.px(40.0),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$title',style: TextStyle(fontSize: Adapt.px(40.0),color: Colors.white,),),
          ],
        )
      ),
      onTap: downLoad,
    );

  }
}