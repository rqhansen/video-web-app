import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/widgets/baseWidgets/TapAnimateWidget.dart';
import 'package:video_app/constant/netConfig.dart';

/// 图片的包装类
class Poster extends StatelessWidget {
  Poster({
      Key key,
      @required this.width,
      @required this.height,
      @required this.imgUrl,
  }) : super(key: key);

  /// 图片宽
  final double width;
  /// 图片高
  final double height;
  /// 图片url
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return TapAnimateWidget(
      child: Padding(
        padding: EdgeInsets.all(Adapt.px(2.0)),
        child: Image.network(
          "${NetConfig.baseUrl}/common/$imgUrl",
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}