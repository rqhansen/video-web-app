import 'package:flutter/material.dart';
//import 'package:video_app/utils/adapt.dart';

class CustomAlertDialog{
  static void showAlertDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('不支持该文件下载'),
              title: Center(
                  child: Text('温馨提示'),
              ),
            actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                 child: Text('确定'),
            ),
              ],
            );
          }
      );
  }
}