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

class WeekMovie extends StatefulWidget {

  _WeekMovieState createState() => _WeekMovieState();
}

class _WeekMovieState extends State<WeekMovie> {
  
  List typeMovies = [];
  ScrollController _controller = new ScrollController();
  // 是否显示回顶部按钮
  bool showToTopBtn = false;
  
  @override
  void initState() {
    super.initState();
    initData();
    handlePageScroll();
  }
  
  void initData() async {
    getTypeMovies();
  }

  Future<void> _onRefresh(bool showDropMenu) async{
    if(!showDropMenu) { /// 如果下拉菜单显示了，则隐藏
        StoreProvider.of<AppState>(context).dispatch(new SwitchShowDropMenuAction(!showDropMenu));
        if(FocusScope.of(context).hasFocus) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
    }
    await getTypeMovies(cusOptions: Options(extra: {'loading': false}));
  }

  void _goTypeMovie(BuildContext context,String typeName) {
      Navigator.pushNamed(context, 'type_movie',arguments: typeName);
  }

  // 监听滚动位置
  void handlePageScroll() {
    _controller.addListener((){
      if(_controller.offset < Adapt.px(2000.0) && showToTopBtn == true) {
        setState(() {
          showToTopBtn = false;
        });
      } else if(_controller.offset >= Adapt.px(2000.0) && showToTopBtn == false){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  Future<void> getTypeMovies({Options cusOptions}) async{
    HttpUtil httpClient = HttpUtil.getInstance();
    var res = await httpClient.get('/api/weekMovie',options: cusOptions);
    var data = res.data['data']['typeMovie'];
    setState((){
      typeMovies = data;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(barHeight: Adapt.px(90.0),),
      body: StoreConnector<AppState,bool>(
        builder: (context,showDropMenu) {
          return RefreshIndicator(
            onRefresh: () => _onRefresh(showDropMenu),
            child: Offstage(
              offstage: typeMovies.length == 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    CustomScrollView(
                      controller: _controller,
                      slivers: <Widget>[
                        SliverFixedExtentList(
                            itemExtent: Adapt.px(636.0),
                            delegate: SliverChildBuilderDelegate((BuildContext context,int outIndex) {
                              var movies = typeMovies[outIndex];
                              var firstMovie = movies[0];
                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    titleBar(context, '${firstMovie['typeName']}', '${firstMovie['filmType']}'),
                                    Expanded(
                                        child:  GridView.builder(
                                          physics: const NeverScrollableScrollPhysics(),/// 禁止滚动
                                          itemCount: movies.length,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10.0, crossAxisSpacing: 0.0, crossAxisCount: 2, childAspectRatio: 0.72,),
                                          itemBuilder: (BuildContext context, int innerIndex) {
                                            var item = movies[innerIndex];
                                            var isNew = item['isNew'];
                                            var isOdd = (innerIndex % 2 == 0);
                                            return TapAnimateWidget(
                                              child: Padding(
                                                padding: isOdd ? EdgeInsets.only(left: Adapt.px(5.0)) : EdgeInsets.only(right: Adapt.px(5.0)),
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            Adapt.px(2.0)),
                                                        child: Image.network(
                                                          "${NetConfig.baseUrl}/common/${item['indexImgSrc']}",
                                                          width: Adapt.screenW() * 0.46,
                                                          height: Adapt.screenH() * 0.34,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.symmetric(
                                                        vertical: Adapt.px(6.0),),
                                                      child: Text(
                                                        '${item["fullName"]}',
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(fontWeight: FontWeight.w600, color: CustomColors.redText),
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
                                              ),
                                              onTap: () {},
                                            );
                                          },
                                        ),
                                    ),
                                  ],
                                ),
                              );
                              },
                              childCount: typeMovies.length,
                            ),
                        ),
                        SliverToBoxAdapter(
                          child: Footer(),
                        ),
                      ]
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      width: Adapt.screenW(),
                      height: Adapt.screenH() - Adapt.px(90.0),
                      child: Offstage(
                        offstage: showDropMenu,
                        child: AnimatedOpacity(
                          opacity: showDropMenu ? 0 : 1.0,
                          duration: Duration(milliseconds: 300),
                          child: DropMenu(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )
          );
        },
        converter: (store) =>  store.state.showDropMenu,
      ),
        floatingActionButton: !showToTopBtn ? null : CustomFloatButton(controller: _controller,)
    );
  }

  /// titleBar
  Widget titleBar(BuildContext context,String typeMovieName,String typeName) {
    return Padding(
        padding: EdgeInsets.only(bottom: Adapt.px(20.0),),
        child: TitleBar(
          headTitle: '最新$typeMovieName',
          actionTitle: '更多',
          action:() {
            _goTypeMovie(context,typeName);
          },
        ),
    );
  }
}