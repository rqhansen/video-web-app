import 'package:flutter/cupertino.dart';
import 'package:video_app/page/home.dart';
import 'package:video_app/page/more.dart';
import 'package:video_app/page/typeMovie.dart';
import 'package:video_app/page/weekMovie.dart';
import 'package:video_app/page/movieDetail.dart';
import 'package:video_app/page/search.dart';
import 'package:video_app/page/downLoadThunder.dart';

final routers = {
   '/': (context) => Home(),
   'more_movie': (context) => MoreMovie(),
   'week_movie': (context) => WeekMovie(),
   'down_load_thunder': (context) => DownLoadThunder(),
   'movie_detail': (context) => MovieDetail(url: ModalRoute.of(context).settings.arguments),
   'type_movie': (context) => TypeMovie(movieTypeName: ModalRoute.of(context).settings.arguments),
   'search': (context) => Search(movieName: ModalRoute.of(context).settings.arguments),
};