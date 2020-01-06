import 'package:flutter/material.dart';
import 'package:video_app/utils/adapt.dart';

class CustomFloatButton extends StatelessWidget{
  final ScrollController controller;

  CustomFloatButton({Key key,@required this.controller}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adapt.px(80.0),
      height: Adapt.px(80.0),
      child: FloatingActionButton(
        child: Icon(Icons.arrow_upward,size: Adapt.px(60.0),),
        onPressed: () {
          controller.animateTo(.0,duration: Duration(milliseconds: 400,),curve:Curves.ease);
        },
      ),
    );
  }
}