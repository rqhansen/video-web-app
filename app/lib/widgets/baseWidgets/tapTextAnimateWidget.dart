import 'package:flutter/material.dart';
import 'package:video_app/constant/Colors.dart';

/// 文本颜色过渡动画
class TapTextAnimateWidget extends StatefulWidget {

  final Widget child;
  /// 点击回调函数
  final Function onTap;
  /// 文本初始颜色
  final Color textColor;

  const TapTextAnimateWidget({Key key,this.child,this.onTap,this.textColor = Colors.white}) : super(key : key);

  @override
  _TapTextAnimateWidgetState createState() => _TapTextAnimateWidgetState();
}

class _TapTextAnimateWidgetState extends State<TapTextAnimateWidget> {

  var isDown = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 300),
        child: widget.child,
        style: isDown ? TextStyle(color: CustomColors.redText) : TextStyle(color: widget.textColor,),
      ),
      onTap: widget.onTap,
      onTapDown: (d) => setState(() => this.isDown = true),
      onTapUp: (d) => setState(() => this.isDown = false),
      onTapCancel: () => setState(() => this.isDown = false),
    );
  }
}