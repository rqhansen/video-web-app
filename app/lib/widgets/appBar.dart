import 'package:flutter/material.dart';
import 'package:video_app/redux/actions/dropMenu.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/redux/appState.dart';
import 'package:video_app/utils/adapt.dart';

// 自定义appBar,
// appBar 高度从外部传入
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  /// appBar 高度
  final double barHeight;
  CustomAppBar({Key key,@required this.barHeight}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(barHeight);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {


  @override
  Widget build(BuildContext context) {
    /// 使用SafeArea防止沉浸式appBar
    return new SafeArea(
        child: new StoreConnector<AppState,bool>(
            builder: (context,showDropMenu) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Color.fromRGBO(136, 136, 136, .2), offset: Offset(2.0, 2.0),blurRadius: 2.0),]
                ),
                child: Stack(
                  fit: StackFit.passthrough,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        height: Adapt.px(90.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image(image: AssetImage('images/logo.jpg'), width: Adapt.px(200), height: Adapt.px(72),),
                            Material(
                              color: Colors.white,
                              child: Ink(
                                child:   InkWell(
                                  onTap: () {
                                    StoreProvider.of<AppState>(context).dispatch(new SwitchShowDropMenuAction(!showDropMenu));
                                  },
                                  child: SizedBox(
                                    width: Adapt.px(90),
                                    child: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 300),
                                      transitionBuilder: (Widget child,Animation<double> animation) {
                                          return ScaleTransition(child: child,scale: animation,);
                                      },
                                      child: Icon(!showDropMenu ? Icons.close : Icons.menu,key: ValueKey<bool>(showDropMenu),color: Theme.of(context).primaryColor,size: Adapt.px(80),),
                                    ),
                                  ),
                                ),
                              ) ,
                            ),
                          ],
                        ) ,
                      ),
                    ),
                  ],
                ),
              );
            },
            converter: (store) => store.state.showDropMenu),
        );
  }
}
