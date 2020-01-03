import 'package:flutter/material.dart';
import 'package:video_app/constant/hotMovies.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/constant/typeMovies.dart';
import 'package:video_app/constant/recentMovies.dart';

class DropMenu extends StatefulWidget {

  DropMenu({Key key}) : super(key : key);

  @override
  _DropMenuState createState() => _DropMenuState();

}

class _DropMenuState extends State<DropMenu> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, .5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  height: Adapt.px(76.0),
                  child: TextField(
                    cursorWidth: Adapt.px(Adapt.px(4.0)),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.only(left: Adapt.px(20.0)),
                        hintText: '输入电影名称搜索...',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(0.0),
                        )),
                  ),
                ),
              ),
                  Container(
                    width: Adapt.px(200.0),
                    height: Adapt.px(76.0),
                    child: FlatButton(
                       color: Color.fromRGBO(77, 166, 255, 1),
                       textColor: Colors.white,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                       child: Text('影视搜索',style: TextStyle(fontSize: Adapt.px(32.0)),),
                       onPressed: () {
                          print('111');
                       }
                    ),
                  )
//              ),
            ],
          ),
          DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: Adapt.px(30.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.center,
//                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  getListTitle('电影'),
                  Divider(height: Adapt.onePx(),color: Colors.white,),
                  Container(
                    height: Adapt.px(228.0),
                    child: GridView.count(
                      crossAxisCount: 4,
                      childAspectRatio: 2.4,
                      crossAxisSpacing:0,
                      children: TypeMovies.movieList.map((item) => Center(child: Text('$item'))).toList(),
                    ),
                  ),
                  getListTitle('热门电影'),
                  Divider(height: Adapt.onePx(),color: Colors.white,),
                  Container(
                    height: Adapt.px(78.0),
                    child: GridView.count(
                      crossAxisCount: 4,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 0,
                      children: HotMovies.hotMovies.map((hotMovie) => Center(child: Text('$hotMovie',overflow: TextOverflow.ellipsis,))).toList(),
                    ),
                  ),
                  getListTitle('近期电影'),
                  Divider(height: Adapt.onePx(),color: Colors.white,),
                  Container(
                    height: Adapt.px(78.0),
                    padding: EdgeInsets.only(left: Adapt.px(20.0),top: Adapt.px(10.0)),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio:5,
                      crossAxisSpacing: 0,
                      children: RecentMovies.recentMovies.map((recentMovie) => Center(child: Text('$recentMovie',overflow: TextOverflow.visible,))).toList(),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }

  // 获取标题控件
  Widget getListTitle(String title) {
      return Container(
        height: Adapt.px(80.0),
        padding: EdgeInsets.only(top: Adapt.px(24.0)),
        child: Text('$title',),
      );
  }
}