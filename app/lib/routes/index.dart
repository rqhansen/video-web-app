import 'package:flutter/cupertino.dart';
import 'package:video_app/page/home.dart';
import 'package:video_app/page/more.dart';
import 'package:video_app/page/typeMovie.dart';
import 'package:video_app/page/movieDetail.dart';

final routers = {
   '/': (context) => Home(),
   'movie_detail': (context) => MovieDetail(url: ModalRoute.of(context).settings.arguments),
   'type_movie': (context) => TypeMovie(movieTypeName: ModalRoute.of(context).settings.arguments),
   'more_movie': (context) => MoreMovie()
};