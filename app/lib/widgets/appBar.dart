import 'package:flutter/material.dart';
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
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      titleSpacing: Adapt.px(-3.0),
      title:Image(
          image: AssetImage('images/logo.jpg'),
          width: Adapt.px(202),
          height: Adapt.px(72),
      ),
      actions: <Widget>[
         InkWell(
           borderRadius: BorderRadius.all(Radius.circular(Adapt.px(100)),),
           onTap: () {
             // code...
           },
           child: SizedBox(
             width: Adapt.px(90),
             child:   Icon(Icons.menu,color: Theme.of(context).primaryColor,size: Adapt.px(80),),
           ),
         ),
      ],
    );
  }
}
