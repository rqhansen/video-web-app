import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/widgets/baseWidgets/tapTextAnimateWidget.dart';

class Page extends StatefulWidget {
  /// 总页数
  final int total;
  /// 当前页数
  final int currPage;
  /// 首页
  Function goFirstPage;
  /// 上一页
  Function goPrevPage;
  /// 下一页
  Function goNextPage;
  /// 末页
  Function goEndPage;

  Page({
    Key key,
    @required this.total,
    @required this.currPage,
    @required this.goFirstPage,
    @required this.goPrevPage,
    @required this.goNextPage,
    @required this.goEndPage,
  }) : super(key : key);
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {

  /// 总页数
  int get totalPage => (widget.total / 14).ceil();
  /// 是否显示上一页
  bool get showPrePage => widget.currPage > 1;
  /// 是否显示下一页
  bool get showNextPage => widget.currPage < totalPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adapt.px(60.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
        border: Border.all(
          color: Color.fromRGBO(191, 228, 255, 1),
          width: Adapt.onePx(),
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Offstage(
              offstage: widget.total == 0,
              child: DefaultTextStyle(
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Adapt.px(26.0),
                  ),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        TapTextAnimateWidget(
                          textColor: Theme.of(context).primaryColor,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: Adapt.px(10.0),),
                            child: Text('首页'),
                          ),
                          onTap: widget.goFirstPage,
                        ),
                        Offstage(
                          offstage: showPrePage!=true,
                          child: TapTextAnimateWidget(
                            textColor: Theme.of(context).primaryColor,
                            child: Container(
                              margin: EdgeInsets.only(right: Adapt.px(10.0),),
                              child: Text('上一页'),
                            ),
                            onTap: widget.goPrevPage,
                          ),
                        ),
                        Offstage(
                          offstage: showNextPage != true,
                          child: TapTextAnimateWidget(
                            textColor: Theme.of(context).primaryColor,
                            child: Text('下一页'),
                            onTap: widget.goNextPage,
                          ),
                        ),
                       TapTextAnimateWidget(
                         textColor: Theme.of(context).primaryColor,
                         child: Container(
                            margin: EdgeInsets.symmetric(horizontal: Adapt.px(10.0),),
                            child: Text('末页'),
                         ),
                         onTap: widget.goEndPage,
                       ),
                      ]
                    ),
                  ),
              ),
            ),
            Text('共找到'),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: Adapt.px(10.0),),
                child: Text('${widget.total}'),
            ),
            Text('条记录'),
          ],
      ),
    );

  }
}