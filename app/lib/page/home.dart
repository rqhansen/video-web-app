import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/widgets/titleBar.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/baseWidgets/TapAnimateWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todayMovieList = [];
  @override
  void initState() {
    super.initState();
    getTodayMovies();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _onRefresh,
        child: Container(
            child: Column(
            children: <Widget>[
              TitleBar(headTitle: '今日热门电影推荐', actionTitle: '更多'),
              Expanded(
                 child: GridView.builder(
                    padding: EdgeInsets.only(left:Adapt.px(8.0),top: Adapt.px(32.0),right: Adapt.px(16.0),bottom:0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.71,
                   ),
                   itemCount: (todayMovieList.length / 2 ).ceil(),
                   itemBuilder: (BuildContext context, int index) {
                     var item = todayMovieList[index];
                     var isNew = item['isNew'];
                     return  Container(
                         padding: EdgeInsets.only(left: Adapt.px(16),top: 0,right: Adapt.px(8.0),bottom: Adapt.px(20)),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             TapAnimateWidget(
                              child: Padding(
                                  padding: EdgeInsets.all(Adapt.px(2.0)),
                                  child: Image.network(
                                    "http://www.wx520.net/common/${item['indexImgSrc']}",
                                    width: Adapt.screenW() * 0.46,
                                    height: Adapt.screenH() * 0.34,
                                    fit: BoxFit.cover,
                                  ),
                              ),
                             ),
                             Container(
                               padding: EdgeInsets.only(left: 0, top: Adapt.px(12.0),bottom: Adapt.px(8.0)),
                               child: Text('${item['fullName']}',overflow: TextOverflow.ellipsis,style: TextStyle(
                                 fontWeight: FontWeight.w600,
                                 color: isNew ?  Color.fromRGBO(250, 0, 0, 1) : Colors.black,
                               ),),
                             ),
                             Text('${item['pubDate']}',style: TextStyle(
                               color: isNew ?  Color.fromRGBO(250, 0, 0, 1) : Colors.black,
                             ),)
                           ],
                         )
                     );
                   }),
               ),
              Footer()
            ],
            )),
    );
  }

  /// 获取首页数据
  Future<void> getTodayMovies() async{
      HttpUtil httpClient = HttpUtil.getInstance();
      var res = await httpClient.get('/api/homeMovieList');
      setState(() {
        todayMovieList = todayMovieList = res.data['data']['movies'];
      });
  }
  Future<void> _onRefresh() async{
    await getTodayMovies();
  }
}
