import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';

class TapAnimateWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const TapAnimateWidget({Key key,this.child,this.onTap}) : super(key : key);

  @override
  _TapAnimateWidgetState createState() => _TapAnimateWidgetState();
}

class _TapAnimateWidgetState extends State<TapAnimateWidget> {
  var isDown = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          border: new Border.all(
            width: Adapt.onePx(),
            color: isDown ? Color.fromRGBO(190, 18, 4, 1) : Colors.transparent,
          ),
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