import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/redux/appState.dart';
import 'package:video_app/widgets/baseWidgets/tapAnimateWidget.dart';
import 'package:video_app/redux/actions/dropMenu.dart';
import 'package:video_app/constant/Colors.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/widgets/titleBar.dart';
import 'package:video_app/widgets/dropMenu.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/indicatorButton.dart';
import 'package:video_app/constant/netConfig.dart';

class Home extends StatefulWidget {
  
  Home({Key key}) : super(key : key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  // 电影列表
  List todayMovieList = [];
  ScrollController _controller = new ScrollController();
  // 是否显示回顶部按钮
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
    // 监听页面的滚动
    handlePageScroll();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 初始化数据
  void initData() async{
    await getTodayMovies();
  }
  // 下拉刷新函数
  Future<void> _onRefresh(bool showDropMenu) async {
    if(!showDropMenu) { /// 如果下拉菜单显示了，则隐藏
      StoreProvider.of<AppState>(context).dispatch(new SwitchShowDropMenuAction(!showDropMenu));
      if(FocusScope.of(context).hasFocus) { /// 失焦
        FocusScope.of(context).requestFocus(FocusNode());
      }
    }
    await getTodayMovies(cusOptions: Options(extra: {'loading': false}));
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

  /// 去电影详情
  void goMovieDetail(BuildContext context,Map movie) {
    Navigator.pushNamed(context,'movie_detail', arguments: "${movie['filmType']}/${movie['id']}");
  }

  /// 去更多电影
  void goMoreMovie(BuildContext context) {
      Navigator.pushNamed(context, 'more_movie');
  }

  // 获取首页数据
  Future<void> getTodayMovies({Options cusOptions}) async {
    HttpUtil httpClient = HttpUtil.getInstance();
    var res = await httpClient.get('/api/homeMovieList',options: cusOptions);
    setState(() {
      todayMovieList = res.data['data']['movies'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(barHeight: Adapt.px(90),),
      body: new StoreConnector<AppState,bool>(
        builder:(context,showDropMenu) {
          return  RefreshIndicator(
            onRefresh: () => _onRefresh(showDropMenu),
            child: Stack(
              children: <Widget>[
                Container(
                    child: Column(children: <Widget>[
                      TitleBar(
                        headTitle: '今日热门电影推荐',
                        actionTitle: '更多',
                        action:() {
                          goMoreMovie(context);
                        },
                      ),
                      Expanded(
                          child: CustomScrollView(
                            controller: _controller,
                            slivers: <Widget>[
                              SliverPadding(
                                  padding: EdgeInsets.symmetric(vertical: Adapt.px(20.0)),
                                  sliver: SliverGrid(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10.0,crossAxisSpacing: 0.0,crossAxisCount: 2,childAspectRatio: 0.72,),
                                    delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {
                                        var item = todayMovieList[index];
                                        var isNew = item['isNew'];
                                        var isOdd = (index % 2 == 0);
                                        return TapAnimateWidget(
                                            child: Container(
                                              padding: isOdd ? EdgeInsets.only(left: Adapt.px(5.0)) : EdgeInsets.only(right: Adapt.px(5.0)),
                                              child: Column(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
//                                                  child:  Poster( width: Adapt.screenW() * 0.46, height: Adapt.screenH() * 0.34, imgUrl: item['indexImgSrc'],),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(Adapt.px(2.0)),
                                                      child: Image.network(
                                                        "${NetConfig.baseUrl}/common/${item['indexImgSrc']}",
                                                        width: Adapt.screenW() * 0.46,
                                                        height: Adapt.screenH() * 0.34,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: Adapt.px(10.0),top: Adapt.px(4.0),right: Adapt.px(10.0),bottom: Adapt.px(6.0)),
                                                    child: Text(
                                                      '${item['fullName']}',
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.redText),
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
//                                          );
                                            ),
                                            onTap: () {
                                              goMovieDetail(context,item);
                                            },
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
                      ]
                    ),
                ),
                Positioned(
                  top: Adapt.px(0),
                  left: 0,
                  width: Adapt.screenW(),
                  height: Adapt.screenH() - Adapt.px(90.0),
                  child: Offstage(
                    offstage: showDropMenu,
                    child: AnimatedOpacity(
                      opacity: showDropMenu ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 300),
                      child: DropMenu(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        converter: (store) => store.state.showDropMenu,
      ),
      floatingActionButton: !showToTopBtn ? null : CustomFloatButton(controller: _controller,)
    );
  }
}
