import 'package:flutter/material.dart';

/// 自定义appBar,
/// appBar 高度从外部传入
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{

  final double barHeight;
  CustomAppBar({Key key,this.barHeight}) : super(key: key);
//  CustomAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight);

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
      titleSpacing: -3.0,
      title:Image(
          image: AssetImage('images/logo.jpg'),
          width: 102,
          height: 36
      ),
      actions: <Widget>[
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(100),),
          onTap: () {
            // code...
          },
          child: SizedBox(
            width: 45,
            child:   Icon(Icons.menu,color: Color.fromRGBO(0, 74, 132, 1),size: 40,),
          ),
        ),
      ],
    );
  }
}
