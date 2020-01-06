import 'package:flutter/cupertino.dart';
import 'package:video_app/page/home.dart';
import 'package:video_app/page/movieDetail.dart';

final routers = {
   'movie_detail': (context) => MovieDetail(url: ModalRoute.of(context).settings.arguments),
   '/': (context) => Home(),
};