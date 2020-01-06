
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/redux/appState.dart';
import 'package:video_app/widgets/dropMenu.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/indicatorButton.dart';
import 'package:video_app/constant/Colors.dart';

class MovieDetail extends StatefulWidget {
  /// 电影的url
  final String url;

   MovieDetail({Key key,@required this.url}) : super(key : key);


  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  ScrollController _controller = new ScrollController();
  Map movieInfo = {};
  bool showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 获取电影详情
    getMovieDetail();
    /// 监听滚动
    ///
  }

  Future<void> getMovieDetail() async{
    showLoadingDialog();
    var splitMovieInfo = widget.url.split('/');
    var data = <String,String>{
      'movieType': splitMovieInfo[0],
      'id': splitMovieInfo[1]
    };
    HttpUtil httpClient = HttpUtil.getInstance();
    var res = await httpClient.post('/api/getMovieDetail',data: data);
    hideLoadingDialog();
    var movieDetail = res.data['data']['movieDetail'];
    setState(() {
      movieInfo =  movieDetail;
    });
  }

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
      appBar:CustomAppBar(
          barHeight: Adapt.px(90.0),
      ),
      body: StoreConnector<AppState,bool>(
        builder: (context,showDropMenu) {
          return SingleChildScrollView(
            controller: _controller,
            child: Stack(
              children: <Widget>[
                ///这个控件的作用，是将可能高度不受限制的child，调整到一个合适并且合理的尺寸
                IntrinsicHeight(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(left: Adapt.px(8.0),top: Adapt.px(30.0),right: Adapt.px(8.0),bottom: Adapt.px(10.0),),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: Adapt.onePx(),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: Adapt.px(10.0)),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text('当前位置: '),
                                        GestureDetector(
                                          child: Text('万寻电影>',style: TextStyle(color: Theme.of(context).primaryColor),),
                                          onTap: () {},
                                        ),
                                        Text('>'),
                                        GestureDetector(
                                          child: Text('${movieInfo['typeName']}',style: TextStyle(color: Theme.of(context).primaryColor),),
                                        ),
                                        Text('>>${movieInfo['pureName']}下载页面'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Footer(),
                      ],
                    ),
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
      ) ,
      floatingActionButton: !showToTopBtn ? null : CustomFloatButton(controller: _controller,)
    );
  }
}