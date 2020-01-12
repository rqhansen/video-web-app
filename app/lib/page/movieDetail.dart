
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:load/load.dart';
import 'package:video_app/constant/netConfig.dart';
import 'package:video_app/constant/Colors.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/redux/appState.dart';
import 'package:video_app/widgets/dropMenu.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/indicatorButton.dart';
import 'package:video_app/widgets/baseWidgets/tapTextAnimateWidget.dart';

class MovieDetail extends StatefulWidget {
  /// 电影的url
  final String url;

   MovieDetail({Key key,@required this.url}) : super(key : key);


  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  ScrollController _controller = new ScrollController();
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  Map movieInfo = {};
  bool showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 获取电影详情
    getMovieDetail();
    /// 监听滚动
    handlePageScroll();
  }

  @override
  void dispose() {
      _tapGestureRecognizer.dispose();
      super.dispose();
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

  /// 监听页面滚动
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

  /// 打开
  void _openThunder(String thunderUrl) async{
    var res = await canLaunch(thunderUrl);
      if(res) { // 判断当前手机是否安装了app，能否正常跳转
        await launch(thunderUrl);
      } else{
        throw 'Could not launch $thunderUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    if(movieInfo['detailImgSrc'] == null) return Text('');
    return Scaffold(
      appBar:CustomAppBar(
          barHeight: Adapt.px(90.0),
      ),
      body: StoreConnector<AppState,bool>(
        builder: (context,showDropMenu) {
          return Offstage(
            offstage: !(movieInfo['fullName'] != null),
            child: Container(
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    controller: _controller,
                    child:  Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: Adapt.px(16.0),top: Adapt.px(30.0),right: Adapt.px(16.0),bottom: Adapt.px(20.0),),
                            child: Container(
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
                                    height: Adapt.px(60.0),
                                    padding: EdgeInsets.symmetric(horizontal: Adapt.px(10.0)),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(247, 247, 247, 1),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text('当前位置: '),
                                        GestureDetector(
                                          child: Text('万寻电影>',style: TextStyle(color: Theme.of(context).primaryColor),),
                                          onTap: () {
                                              Navigator.pushNamed(context, '/');
                                          },
                                        ),
                                        Text('>'),
                                        GestureDetector(
                                          child: Text('${movieInfo['typeName']}',style: TextStyle(color: Theme.of(context).primaryColor),),
                                        ),
                                        Expanded(
                                          child: Text('>>${movieInfo['pureName']}下载页面',overflow: TextOverflow.ellipsis,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Color.fromRGBO(191, 228, 255, 1),
                                    height: Adapt.onePx(),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: Adapt.px(15.0),top: Adapt.px(15.0),right: Adapt.px(15.0),bottom: Adapt.px(15.0)),
                                    child: Column(
                                      children: <Widget>[
                                        Center(
                                          child: Text("${movieInfo['fullName']}"),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: Adapt.px(15.0),bottom: Adapt.px(20.0),),
                                          child: Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            children: <Widget>[
                                              Text('片名：'),
                                              Text('${movieInfo['pureName']}',),
                                              Text('发布时间: '),
                                              Text('${movieInfo['pubDate']}'),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: Adapt.screenW(),
                                          margin: EdgeInsets.only(bottom: Adapt.px(15.0)),
                                          child: Wrap(
                                            alignment: WrapAlignment.start,
                                            children: <Widget>[
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(text: '${movieInfo['pureName']}迅雷下载地址和剧情: '),
                                                      TextSpan(
                                                        text: '点此分享本影片',
                                                        style: TextStyle(color: Theme.of(context).primaryColor),
                                                        recognizer: TapGestureRecognizer()
                                                            ..onTap = () {}
                                                      ),
                                                    ],
                                                  ),
                                                ),
//                                              Text('${movieInfo['pureName']}迅雷下载地址和剧情: '),
//                                              GestureDetector(
//                                                child: Text('点此分享本影片',style: TextStyle(color: Theme.of(context).primaryColor),),
//                                                onTap: () {},
//                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(bottom: Adapt.px(15.0),),
                                          child: Image.network(
                                            '${NetConfig.baseUrl}/common/${movieInfo['detailImgSrc']}',
                                            fit: BoxFit.fill,
                                            width: Adapt.screenW(),
                                            height: Adapt.px(789),
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              sigleRowIntro(!(movieInfo['transName']!=null),'◎译 名',movieInfo['transName']),
                                              sigleRowIntro(!(movieInfo['subPureName']!=null),'◎片 名',movieInfo['subPureName']),
                                              sigleRowIntro(!(movieInfo['year']!=null),'◎年 代',movieInfo['year']),
                                              sigleRowIntro(!(movieInfo['country']!=null),'◎产 地',movieInfo['country']),
                                              sigleRowIntro(!(movieInfo['types']!=null),'◎类 别',movieInfo['types']),
                                              sigleRowIntro(!(movieInfo['language']!=null),'◎语 言',movieInfo['language']),
                                              sigleRowIntro(!(movieInfo['caption']!=null),'◎字 幕',movieInfo['caption']),
                                              sigleRowIntro(!(movieInfo['onDate']!=null),'◎上映日期',movieInfo['onDate']),
                                              sigleRowIntro(!(movieInfo['imdbScore']!=null),'◎IMDb评分',movieInfo['imdbScore']),
                                              sigleRowIntro(!(movieInfo['imdbLink']!=null),'◎IMDb链接',movieInfo['imdbLink']),
                                              sigleRowIntro(!(movieInfo['format']!=null),'◎格 式',movieInfo['format']),
                                              sigleRowIntro(!(movieInfo['fileSize']!=null),'◎文件大小',movieInfo['fileSize']),
                                              sigleRowIntro(!(movieInfo['videoSize']!=null),'◎视频尺寸',movieInfo['videoSize']),
                                              sigleRowIntro(!(movieInfo['filmLength']!=null),'◎片 长',movieInfo['filmLength']),
                                              sigleRowIntro(!(movieInfo['doubanScore']!=null),'◎豆瓣评分',movieInfo['doubanScore']),
                                              sigleRowIntro(!(movieInfo['doubanLink']!=null),'◎豆瓣链接',movieInfo['doubanLink']),
                                              sigleRowIntro(!(movieInfo['director']!=null),'◎导 演',movieInfo['director']),
                                              sigleRowIntro(!(movieInfo['editor']!=null),'◎编 剧',movieInfo['editor']),
                                              sigleRowIntro(!(movieInfo['actor']!=null),'◎主 演',movieInfo['actor']),
                                              sigleRowIntro(!(movieInfo['label']!=null),'◎标 签',movieInfo['label']),
                                              sigleRowIntro(!(movieInfo['shortIntro']!=null),'◎简 介',movieInfo['shortIntro']),
                                              sigleRowIntro(!(movieInfo['getAward']!=null),'◎获 奖',movieInfo['getAward']),
                                              downLoadWidget(movieInfo['downUrl'][0]),
                                              tipWidget()
                                            ],
                                          ),
                                        ),
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
            ),
          );
        },
        converter: (store) => store.state.showDropMenu,
      ) ,
      floatingActionButton: !showToTopBtn ? null : CustomFloatButton(controller: _controller,)
    );
  }

  /// 每一行的介绍
  Widget sigleRowIntro(bool offState,String title,[ content]) {
    var direction = Axis.horizontal;
    List<Widget> items = [Text('$content')];
    switch(title) {
      case '◎主 演' :
        direction = Axis.vertical;
        var content2 = content.map<Widget>((item)=> Text('$item'));
        items =<Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content2.toList(),
          ),
        ];
        break;
      case '◎简 介':
      case '◎获 奖':
        var introList = movieInfo['shortIntro'];
        introList = introList.map<Widget>((intro) {
            return Wrap(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: Adapt.px(8.0)),
                child: Text('           $intro'),
              ),
            ],
        );
        });
        var totalList = <Widget>[];
        totalList.add(
          Container(
            margin: EdgeInsets.only(bottom: Adapt.px(20.0),),
            child: Text('$title:'),) ,
          );
        totalList.addAll(introList);
        return Offstage(
          offstage: offState,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:totalList
            ),
          ),
        );
        break;
      default:
        break;
    }
    return Offstage(
      offstage: offState,
        child:   Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: Adapt.px(200.0),bottom: Adapt.px(15.0)),
              constraints: BoxConstraints(
                minHeight: Adapt.px(36.0),
              ),
              child: Wrap(
                direction: direction,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.start,
                alignment:WrapAlignment.center,
                children: items,
              ),
            ),
            Positioned(
              left: Adapt.px(0.0),
              top: Adapt.px(0.0),
              child: Container(
                width: Adapt.px(200.0),
                height: Adapt.px(55.0),
                child: Text('$title:',textAlign: TextAlign.start,),
              ),
            ),
          ],
        ),
    );
  }
  
  /// 下载UI
  Widget downLoadWidget(downLoadUrl) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('下载地址:',style: TextStyle(color: CustomColors.redText),),
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.symmetric(vertical: Adapt.px(10.0),),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 187, 1),
                border: Border.all(
                  color: Color.fromRGBO(255, 140, 0, 1),
                  width: Adapt.onePx(),
                ),
              ),

              child:   Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  TapTextAnimateWidget(
                      textColor: Theme.of(context).primaryColor,
                      child: Text('$downLoadUrl',softWrap: false,maxLines: 1,style: TextStyle(fontSize: Adapt.px(24.0),),),
                      onTap: () {
                      _openThunder(downLoadUrl);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  /// 温馨提示
  Widget tipWidget() {
    TextStyle _style = new TextStyle(color: CustomColors.redText);
    return Container(
      child: Wrap(
        children: <Widget>[
          DefaultTextStyle(
              style: TextStyle(fontSize: Adapt.px(24.0),),
              child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '温馨提示: 使用迅雷您可以边下边播，如遇迅雷下载出错可换用',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      TextSpan(
                          text: '无限制版迅雷',
                          style: _style,
                          recognizer: _tapGestureRecognizer
                            ..onTap = () {}
                      ),
                    ],
                  )
              ),
          ),
        ],
      ),
    );
  }
}