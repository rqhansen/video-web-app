import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_app/utils/request.dart';
import 'package:video_app/utils/adapt.dart';
import 'package:video_app/redux/appState.dart';
import 'package:load/load.dart';
import 'package:video_app/widgets/baseWidgets/tapAnimateWidget.dart';
import 'package:video_app/redux/actions/dropMenu.dart';
import 'package:video_app/constant/Colors.dart';
import 'package:video_app/widgets/appBar.dart';
import 'package:video_app/widgets/titleBar.dart';
import 'package:video_app/widgets/dropMenu.dart';
import 'package:video_app/widgets/footer.dart';
import 'package:video_app/widgets/indicatorButton.dart';
import 'package:video_app/constant/netConfig.dart';

class TypeMovie extends StatefulWidget {

  _TypeMovieState createState() => _TypeMovieState();
}

class _TypeMovieState extends State<TypeMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(barHeight: Adapt.px(90.0),),
      body: new StoreConnector<AppState,bool>(
        builder: (context,showDropMenu) {
          return Stack(

          );
        },
      ),
      // floatingActionButton: ,
    );
  }
}