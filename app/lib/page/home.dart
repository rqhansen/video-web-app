import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/constant/Colors.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/widgets/titleBar.dart';
import 'package:video_app/widgets/dropMenu.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/poster.dart';

class Home extends StatefulWidget {
  
  Home({Key key}) : super(key : key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 电影列表
  List todayMovieList = [];
  ScrollController _controller = new ScrollController();
  // 是否显示回顶部按钮
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    // 获取今日热门电影
    getTodayMovies();
    // 监听页面的滚动
    handlePageScroll();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 获取首页数据
  Future<void> getTodayMovies() async {
    HttpUtil httpClient = HttpUtil.getInstance();
    var res = await httpClient.get('/api/homeMovieList');
    setState(() {
      todayMovieList = todayMovieList = res.data['data']['movies'];
    });
  }

  // 监听滚动位置
  void handlePageScroll() {
    _controller.addListener((){
      if(_controller.offset < Adapt.px(800.0) && showToTopBtn == true) {
        setState(() {
          showToTopBtn = false;
        });
      } else if(_controller.offset >= Adapt.px(800.0) && showToTopBtn == false){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  // 下拉刷新函数
  Future<void> _onRefresh() async {
    await getTodayMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(barHeight: Adapt.px(90),),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Stack(
          children: <Widget>[
            Container(
                child: Column(children: <Widget>[
                  TitleBar(headTitle: '今日热门电影推荐', actionTitle: '更多',),
                  Expanded(
                    child: Scrollbar(
                      child: CustomScrollView(
                        controller: _controller,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: EdgeInsets.only(left: Adapt.px(8.0),top: Adapt.px(32.0),right: Adapt.px(16.0),bottom: 0,),
                            sliver: new SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,),
                              delegate: new SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  var item = todayMovieList[index];
                                  var isNew = item['isNew'];
                                  return Container(
                                    padding: EdgeInsets.only(left: Adapt.px(16),top: 0,right: Adapt.px(8.0),bottom: Adapt.px(20),),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Poster( width: Adapt.screenW() * 0.46, height: Adapt.screenH() * 0.34, imgUrl: item['indexImgSrc'],),
                                        Container(
                                          padding: EdgeInsets.only(left: 0,top: Adapt.px(12.0),bottom: Adapt.px(8.0),),
                                          child: Text(
                                            '${item['fullName']}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.redText,),
                                          ),
                                        ),
                                        Text(
                                          '${item['pubDate']}',
                                          style: TextStyle(
                                            color: isNew ? CustomColors.redText : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                childCount: todayMovieList.length,
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Footer(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
                )
            ),
            Positioned(
              top: Adapt.px(0),
              left: 0,
              width: Adapt.screenW(),
              child: Offstage(
                offstage: true,
                child: DropMenu(),
              ),
            )
          ],
        ),
      ),
        floatingActionButton: !showToTopBtn ? null : floatActionButton(),
      );
  }

  // 指示器
  Widget floatActionButton() {
    return SizedBox(
      width: Adapt.px(80.0),
      height: Adapt.px(80.0),
      child: FloatingActionButton(
        child: Icon(Icons.arrow_upward,size: Adapt.px(60.0),),
        onPressed: () {
          _controller.animateTo(.0,duration: Duration(milliseconds: 400,),curve:Curves.ease);
        },
      ),
    );
  }
}
