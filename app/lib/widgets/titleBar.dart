import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/constant/Colors.dart';
class TitleBar extends StatelessWidget {

  TitleBar({
    Key key,
    @required this.headTitle,
    this.actionTitle = ''
  }) :  assert(headTitle != null),
        super(key : key);

  // 大字标题
  final String headTitle;
  // 更多
  final String actionTitle;


  @override
  Widget build(BuildContext context) {
      return Container(
        height: Adapt.px(80),
        padding: EdgeInsets.symmetric(horizontal: Adapt.px(18.0)),
        decoration: BoxDecoration(
            color: CustomColors.titleBarBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(headTitle,style: TextStyle(
                fontSize: Adapt.px(30),
                fontWeight: FontWeight.w600
            ),),
            Material(
              child: Ink(
                  child: InkWell(
                    onTap: () {},
                    child: Text(actionTitle,style: TextStyle(
                        color: Theme.of(context).primaryColor,
                    ),),
                  )
              ),
            )
          ],
        ),
      );
  }
}