import 'package:dio/dio.dart';

class NetConfig {
  static final baseUrl = 'http://www.wx520.net';
  static final connectTimeout = 6000;
  static final receiveTimeout = 6000;
  static final contentType = 'application/json';
  static final responseType = ResponseType.json;
}