import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/constant/Colors.dart';

/// widget的包装类，长按出现边框，带动画过渡
class TapAnimateWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final Color initColor;
  final Color tapDownColor;

  const TapAnimateWidget({
    Key key,
    this.child,
    this.initColor = Colors.transparent,
    this.tapDownColor = const Color.fromRGBO(245, 245, 245, .1),
    this.onTap
  }) : super(key : key);

  @override
  _TapAnimateWidgetState createState() => _TapAnimateWidgetState();
}

class _TapAnimateWidgetState extends State<TapAnimateWidget> {
  var isDown = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        decoration: BoxDecoration(
          color: isDown ? widget.tapDownColor : widget.initColor,
//          border: new Border.all(
//            width: Adapt.onePx(),
//            color: isDown ? CustomColors.redText : Colors.transparent,
//          ),
        ),
        child: widget.child,
      ),
      onTap: widget.onTap,
      onTapDown: (d) => setState(() => this.isDown = true),
      onTapUp: (d) => setState(() => this.isDown = false),
      onTapCancel: () => setState(() => this.isDown = false),
    );
  }
}