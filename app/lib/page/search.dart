import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/redux/appState.dart';
import 'package:video_app/widgets/baseWidgets/tapAnimateWidget.dart';
import 'package:video_app/constant/Colors.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/widgets/dropMenu.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/indicatorButton.dart';
import 'package:video_app/constant/netConfig.dart';
import 'package:video_app/widgets/baseWidgets/page.dart';

class Search extends StatefulWidget {
  final String movieName;

  Search({Key key,@required this.movieName}) : super(key : key);
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  dynamic movieList = '';
  int total = 0;
  int currPage = 0;
  bool showToTopBtn = false;
  ScrollController _controller = new ScrollController();

  int get totalPage => (total / 14).ceil();

  @override
  void initState() {
    super.initState();
    initData();
    handlePageScroll();
  }

  void initData() async {
    await searchMovie(1);
  }

  /// 去电影详情
  void goMovieDetail(BuildContext context,Map item) {
    Navigator.pushNamed(context, 'movie_detail', arguments: '${item['type']}/${item["id"]}');
  }

  void goFirstPage() async{
    if(currPage == 1) return;
    await searchMovie(1);
    scrollToTop();
  }

  /// 去上一页
  void goPrevPage() async{
    await searchMovie(--currPage);
    scrollToTop();
  }

  /// 去下一页
  void goNextPage() async{
    await searchMovie(++currPage);
    scrollToTop();
  }

  /// 末页
  void goEndPage() async{
    if(currPage == totalPage) return;
    await searchMovie(totalPage);
    scrollToTop();
  }

  /// 滚动到顶部
  void scrollToTop() {
    _controller.animateTo(.0,duration: Duration(milliseconds: 400,),curve:Curves.ease);
  }

  /// 监听滚动
  void handlePageScroll() {
    _controller.addListener((){
      if(_controller.offset < Adapt.px(600.0) && showToTopBtn == true) {
        setState(() {
          showToTopBtn = false;
        });
      } else if(_controller.offset >= Adapt.px(600.0) && showToTopBtn == false){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  Future<void> searchMovie(int page) async{
      HttpUtil httpClient = HttpUtil.getInstance();
      var res = await httpClient.post('/api/search',data: {'keyword': widget.movieName,'page': page});
      var data = res.data['data'];
      print(data['total']);
      setState(() {
        movieList = data['movies'];
        total = data['total'];
        currPage = page;
      });
  }

  @override
  Widget build(BuildContext context) {
    Color _redText = CustomColors.redText;
    TextStyle _style = TextStyle(color: Theme.of(context).primaryColor,);
    bool showContent = movieList is List;
    return Scaffold(
      appBar: CustomAppBar(barHeight: Adapt.px(90.0),),
      body: new StoreConnector<AppState,bool>(
        builder: (context,showDropMenu) {
          return Offstage(
              offstage: !showContent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: Adapt.px(60),
                            padding: EdgeInsets.symmetric(horizontal: Adapt.px(18.0)),
                            margin: EdgeInsets.only(left: Adapt.px(16.0),top: Adapt.px(30.0),right: Adapt.px(16.0),),
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
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${widget.movieName}',
                                        style: TextStyle(color: CustomColors.redText,),
                                      ),
                                      TextSpan(text: '搜索结果',),
                                    ],
                                  )
                                ),

                              ],
                            ),
                          ),
                          Expanded(
                            child: CustomScrollView(
                              controller: _controller,
                              slivers: <Widget>[
                                SliverPadding(
                                  padding: EdgeInsets.only(left: Adapt.px(16.0), top: Adapt.px(30.0), right: Adapt.px(16.0),),
                                  sliver:  SliverFixedExtentList(
                                    itemExtent: Adapt.px(348.0),
                                    delegate: new SliverChildBuilderDelegate((BuildContext context,int index) {
                                      return TapAnimateWidget(
                                        child: Container(
                                            margin: EdgeInsets.only(bottom: Adapt.px(30.0)),
                                            child: Row(
                                              children: <Widget>[
                                                imageWidget(movieList[index]['indexImgSrc']),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        DefaultTextStyle(
                                                          style: TextStyle(
                                                            fontSize: Adapt.px(32.0),
                                                          ),
                                                          child: Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '${movieList[index]['pureName']}',
                                                                  style: TextStyle(color: _redText,),
                                                                ),
                                                                TextSpan(
                                                                  text: '${movieList[index]['sharpness']}',
                                                                  style: _style,
                                                                ),
                                                              ],
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: Adapt.px(15.0),bottom: Adapt.px(10.0),),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Container(
                                                                child: Row(
                                                                  children: <Widget>[
                                                                    Text('@年 代  '),
                                                                    Text('${movieList[index]['year']}'),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  children: <Widget>[
                                                                    Text('@主 演  '),
                                                                    Expanded(child: Text('${movieList[index]['actor'][0]}',overflow: TextOverflow.ellipsis,),),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  children: <Widget>[
                                                                    Expanded(
                                                                      child: Text(
                                                                        "@简 介  ${movieList[index]['shortIntro']}",
                                                                        maxLines: 3,
                                                                        overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        DefaultTextStyle(
                                                          style: _style,
                                                          child: Text.rich(
                                                            TextSpan(
                                                                children: [
                                                                  TextSpan(text: '更新时间 : ',),
                                                                  TextSpan(text: '${movieList[index]['pubDate']}',style: TextStyle(color: _redText,),),
                                                                  TextSpan(text: '  点击下载',)
                                                                ]
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        onTap: () {
                                          goMovieDetail(context,movieList[index]);
                                        },
                                      );
                                    },
                                      childCount:movieList.length,
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    margin: EdgeInsets.only(left: Adapt.px(16.0), top: Adapt.px(30.0), right: Adapt.px(16.0), bottom: Adapt.px(20.0),),
                                    child: Page(total: total, currPage: currPage, goFirstPage: goFirstPage , goPrevPage: goPrevPage, goNextPage: goNextPage, goEndPage: goEndPage,),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Footer(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
              ),
            );

        },
        converter: (store) => store.state.showDropMenu,
      ),
      floatingActionButton: !showToTopBtn ? null : CustomFloatButton(controller: _controller,),
    );
  }

  // 图片部分
  Widget imageWidget(String url) {
    return Container(
      margin: EdgeInsets.only(right: Adapt.px(30.0)),
      child: Image.network(
        '${NetConfig.baseUrl}/common/$url',
        width: Adapt.px(272.0),
        height: Adapt.px(348.0),
        fit: BoxFit.fill,
      ),
    );
  }
}