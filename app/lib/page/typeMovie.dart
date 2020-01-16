import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/constant/netConfig.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/redux/appState.dart';
import 'package:load/load.dart';
import 'package:video_app/widgets/baseWidgets/tapAnimateWidget.dart';
import 'package:video_app/constant/Colors.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/widgets/dropMenu.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/indicatorButton.dart';
import 'package:video_app/widgets/baseWidgets/page.dart';

class TypeMovie extends StatefulWidget {
  final String movieTypeName;

  TypeMovie({Key key,@required this.movieTypeName}) : super(key : key);
  _TypeMovieState createState() => _TypeMovieState();
}

class _TypeMovieState extends State<TypeMovie> {
  List movieList = [];
  String movieType = '';
  int totalPage = 0;
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;
  
  @override
  void initState() {
    super.initState();
    initData();
    handlePageScroll();
  }
  
  void initData() async{
    showLoadingDialog();
    await getMovieList(1);
    hideLoadingDialog();
  }

  /// 去电影详情
  void goMovieDetail(BuildContext context,Map item) {
      Navigator.pushNamed(context, 'movie_detail',arguments: '${item['type']}/${item["id"]}');
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
  Future<void> getMovieList(int page) async{
      HttpUtil httpClient = HttpUtil.getInstance();
      var res = await httpClient.post('/api/typeMovie',data: {'page': page,'type': widget.movieTypeName});
      var data = res.data['data'];
      print(data['typeMovie'][0]['typeName']);
      setState(() {
        totalPage = data['total'];
        movieList = data['typeMovie'];
        movieType = data['typeMovie'][0]['typeName'];
      });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(color: Theme.of(context).primaryColor);
    return Scaffold(
      appBar: CustomAppBar(barHeight: Adapt.px(90.0),),
      body: new StoreConnector<AppState,bool>(
        builder: (context,showDropMenu) {
          return Offstage(
            offstage: movieList.length == 0,
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
                          height: Adapt.px(60.0),
                          padding: EdgeInsets.symmetric(horizontal: Adapt.px(10.0)),
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
                                        TextSpan(text: '当前位置：'),
                                        TextSpan(
                                          text: '万寻资源网',
                                          style: _style,
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(context, '/');
                                            }
                                        ),
                                        TextSpan(text: '>'),
                                        TextSpan(
                                          text: movieType,
                                          style: _style,
//                                          recognizer:
                                        ),
                                        TextSpan(text: '>>迅雷下载页面'),
                                      ]
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
                                padding: EdgeInsets.only(
                                  left: Adapt.px(16.0),
                                  top: Adapt.px(30.0),
                                  right: Adapt.px(16.0),
                                ),
                                sliver:  SliverFixedExtentList(
                                  itemExtent: Adapt.px(348.0),
                                  delegate: new SliverChildBuilderDelegate(
                                        (BuildContext context,int index) {
                                      return TapAnimateWidget(
                                        child: Container(
                                            margin: EdgeInsets.only(bottom: Adapt.px(30.0)),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(right: Adapt.px(30.0)),
                                                  child: Image.network(
                                                    '${NetConfig.baseUrl}/common/${movieList[index]['indexImgSrc']}',
                                                    width: Adapt.px(272.0),
                                                    height: Adapt.px(348.0),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.only(bottom: Adapt.px(15.0)),
                                                          child: DefaultTextStyle(
                                                            style: TextStyle(
                                                              fontSize: Adapt.px(32.0),
                                                            ),
                                                            child: Text.rich(TextSpan(children: [
                                                              TextSpan(
                                                                text: '${movieList[index]['pureName']}',
                                                                style: TextStyle(
                                                                  color: CustomColors.redText,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: '${movieList[index]['sharpness']}',
                                                                style: TextStyle(
                                                                  color: Theme.of(context).primaryColor,
                                                                ),
                                                              ),
                                                            ]
                                                            ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ),
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
                                                              Expanded(
                                                                child: Text('${movieList[index]['actor'][0]}',overflow: TextOverflow.ellipsis,),
                                                              ),
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
                                                        Container(
                                                            margin: EdgeInsets.only(top: Adapt.px(10.0)),
                                                            child: Row(
                                                              children: <Widget>[
                                                                DefaultTextStyle(
                                                                  style: TextStyle(
                                                                    color: Theme.of(context).primaryColor,
                                                                  ),
                                                                  child: Expanded(
                                                                    child: Text.rich(
                                                                      TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: '更新时间 : ',
                                                                            ),
                                                                            TextSpan(
                                                                              text: '${movieList[index]['pubDate']}',
                                                                              style: TextStyle(
                                                                                color: CustomColors.redText,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                                text: '  点击下载'
                                                                            ),
                                                                          ]
                                                                      ),
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
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
                                child: Page(total: 16,currPage: 1,),
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
}