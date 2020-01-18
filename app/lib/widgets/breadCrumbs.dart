import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/widgets/baseWidgets/tapTextAnimateWidget.dart';

class BreadCrumbs extends StatelessWidget {

    /// 电影的类型名称
    final String movieTypeName;
    /// 去分类电影列表
    final String movieType;
    /// 标题名称
    final String titleName;
    /// 是否可以点击去分类电影
    final bool canClick;

    BreadCrumbs({
        Key key,
        @required this.movieTypeName,
        @required this.movieType,
        @required this.titleName,
        this.canClick = true
    }) : super(key : key);

    ///去首页
    void goHome(BuildContext context) {
      Navigator.pushNamed(context, '/');
    }
    /// 去电影类型
    void goTypeMovie(BuildContext context) {
      Navigator.pushNamed(context, 'type_movie',arguments: movieType);
    }

    @override
    Widget build(BuildContext context) {
      Color _typeColor = Theme.of(context).primaryColor;
      TextStyle _style =  TextStyle();
      return Container(
          height: Adapt.px(60.0),
          padding: EdgeInsets.symmetric(horizontal: Adapt.px(10.0)),
          decoration: BoxDecoration(
            color: Color.fromRGBO(247, 247, 247, 1),
            border: Border.all(
              color: Color.fromRGBO(191, 228, 255, 1),
              width: Adapt.onePx(),
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            children: <Widget>[
              Text('当前位置: '),
              TapTextAnimateWidget(
                child: Text('万寻电影',style: _style,),
                textColor: _typeColor,
                onTap: () {
                  goHome(context);
                },
              ),
              Text('>>'),
              TapTextAnimateWidget(
                child: Text('$movieTypeName'),
                textColor: _typeColor,
                onTap: () {
                  if(canClick == false) {
                    return;
                  }
                  goTypeMovie(context);
                },
              ),
              Expanded(
                  child: Text('>$titleName下载页面',overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
      );
    }
}