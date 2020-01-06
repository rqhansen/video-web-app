import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/redux/actions/dropMenu.dart';
import 'package:video_app/constant/hotMovies.dart';
import 'package:video_app/redux/appState.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/constant/typeMovies.dart';
import 'package:video_app/constant/recentMovies.dart';
import 'package:video_app/widgets/baseWidgets/tapTextAnimateWidget.dart';

class DropMenu extends StatefulWidget {

  DropMenu({Key key}) : super(key : key);

  @override
  _DropMenuState createState() => _DropMenuState();

}

class _DropMenuState extends State<DropMenu> {

  ///  用户操作输入的内容
  TextEditingController _movieNameController = TextEditingController();
  /// 用于判断聚焦还是失焦
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  /// 去搜索
  void handleSearch() {
    var searchText = _movieNameController.text;
    if(searchText.isNotEmpty) {
      _movieNameController.clear();
    }
    /// 手动失焦
    loseFocus();
  }

  /// 关闭下拉菜单时清空输入框的值
  void handleCloseDropMenu(showDropMenu) {
    if(showDropMenu) { /// 关闭下拉框了
      if(_movieNameController.text.isNotEmpty) {
        _movieNameController.clear();
      }
    }
  }

  // 手动失焦
  void loseFocus() {
    if(focusNode.hasFocus) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  /// 去其它页面通知关闭当前下拉菜单
  void closeDropMenu(showDropMenu) {
      StoreProvider.of<AppState>(context).dispatch(new SwitchShowDropMenuAction(!showDropMenu));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,bool>(
        builder: (context,showDropMenu) {
            /// showDropMenu状态变化后，清空输入框的值
            handleCloseDropMenu(showDropMenu);
            return Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - Adapt.px(90),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, .5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
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
                                  ),
                                ),
                                controller: _movieNameController,
                                focusNode:focusNode,
                                inputFormatters: [ /// 不准输入空格
                                  BlacklistingTextInputFormatter(RegExp('\\s')),
                                ],
                                onEditingComplete: handleSearch,
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
                                onPressed: handleSearch,
                            ),
                          ),
                        ],
                      ),
                      DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Adapt.px(30.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              getListTitle('电影'),
                              Divider(height: Adapt.onePx(),color: Colors.white,),
                              Container(
                                height: Adapt.px(228.0),
                                child: GridView.count(
                                  crossAxisCount: 4,
                                  childAspectRatio: 2.4,
                                  crossAxisSpacing:0,
                                  children: TypeMovies.movieList.map((item) {
//                                    return Center(child: Text('$item'));
                                      return TapTextAnimateWidget(
                                        child: Center(child: Text('$item',overflow: TextOverflow.ellipsis,),),
                                        onTap: () {
                                        },
                                      );
                                  }).toList(),
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
                                  children: HotMovies.hotMovies.map((hotMovie) {
                                    return TapTextAnimateWidget(
                                      child: Center(
                                        child: Text('${hotMovie["movieName"]}', overflow: TextOverflow.ellipsis,),
                                      ),
                                      onTap: () {
                                        closeDropMenu(showDropMenu);
                                        loseFocus();
                                        Navigator.pushNamed(context, 'movie_detail',arguments: hotMovie['url']);
                                      }
                                    );
                                    }
                                  ).toList(),
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
                                  children: RecentMovies.recentMovies.map((recentMovie) {
                                      return TapTextAnimateWidget(
                                        child: Center(
                                          child: Text('$recentMovie',
                                            overflow: TextOverflow.visible,),
                                        ),
                                        onTap: () {},
                                      );
                                    }).toList(),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ],
            );
        },
        converter: (store) => store.state.showDropMenu,
    );

  }

  /// 获取标题控件
  Widget getListTitle(String title) {
    return Container(
      height: Adapt.px(80.0),
      padding: EdgeInsets.only(top: Adapt.px(24.0)),
      child: Text('$title',),
    );
  }
}