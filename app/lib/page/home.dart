import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/redux/appState.dart';
import 'package:load/load.dart';
import 'package:video_app/redux/actions/dropMenu.dart';
import 'package:video_app/constant/Colors.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/widgets/titleBar.dart';
import 'package:video_app/widgets/dropMenu.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/poster.dart';
import 'package:video_app/widgets/indicatorButton.dart';

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

  // 获取首页数据
  Future<void> getTodayMovies() async {
    HttpUtil httpClient = HttpUtil.getInstance();
    var res = await httpClient.get('/api/homeMovieList');
    setState(() {
      todayMovieList = res.data['data']['movies'];
    });
  }

  // 初始化数据
  void initData() async{
    showLoadingDialog();
    await getTodayMovies();
    hideLoadingDialog();
  }
  // 下拉刷新函数
  Future<void> _onRefresh(bool showDropMenu) async {
    if(!showDropMenu) { /// 如果下拉菜单显示了，则隐藏
      StoreProvider.of<AppState>(context).dispatch(new SwitchShowDropMenuAction(!showDropMenu));
      if(FocusScope.of(context).hasFocus) { /// 失焦
        FocusScope.of(context).requestFocus(FocusNode());
      }
    }
    await getTodayMovies();
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
                      TitleBar(headTitle: '今日热门电影推荐', actionTitle: '更多',),
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
                                        return  Container(
                                          padding: isOdd ? EdgeInsets.only(left: Adapt.px(5.0)) : EdgeInsets.only(right: Adapt.px(5.0)),
                                          child:     Column(
//                                            mainAxisAlignment: MainAxisAlignment.center,
//                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
//                                                child:  Poster( width: Adapt.px(352.0), height: Adapt.px(432.0), imgUrl: item['indexImgSrc'],),
                                                child:  Poster( width: Adapt.screenW() * 0.46, height: Adapt.screenH() * 0.34, imgUrl: item['indexImgSrc'],),
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

  // 指示器
//  Widget floatActionButton() {
//    return SizedBox(
//      width: Adapt.px(80.0),
//      height: Adapt.px(80.0),
//      child: FloatingActionButton(
//        child: Icon(Icons.arrow_upward,size: Adapt.px(60.0),),
//        onPressed: () {
//          _controller.animateTo(.0,duration: Duration(milliseconds: 400,),curve:Curves.ease);
//        },
//      ),
//    );
//  }
}
