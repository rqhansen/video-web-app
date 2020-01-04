import 'package:dio/dio.dart';
import 'package:load/load.dart';
import 'package:video_app/constant/netConfig.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = CancelToken();

  // 获取Dio实例
  static HttpUtil getInstance() {
    if(instance == null) {
      instance = HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    options = BaseOptions(
      baseUrl: NetConfig.baseUrl,
      connectTimeout: NetConfig.connectTimeout,
      receiveTimeout: NetConfig.receiveTimeout,
      headers: {
        'version':'1.0.0',
      },
      contentType: NetConfig.contentType,
      responseType: NetConfig.responseType,
    );
    dio = Dio(options);
    // 添加拦截
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async{
        return options;
      },
      onResponse: (Response response) async{
        return response;
      },
      onError: (DioError e) async{
        hideLoadingDialog();
        print(e);
          return e;
      }
    ));
  }

  // get请求
  get(url,{data,options,cancelToken}) async{
    Response response;
    try {
      response = await dio.get(url,
        queryParameters: data,options: options,cancelToken: cancelToken);
    } on DioError catch (e) {
      print('报错信息为:—————————————————————————————');
      formatError(e);
    }
    return response;
  }

  // post
  post(url,{data,options,cancelToken}) async{
      Response response;
      try {
        response = await dio.post(url,queryParameters: data,options: options,cancelToken: cancelToken);
      } on DioError catch (e) {
        print('报错信息为：——————————————————————————');
        formatError(e);
      }
      return response;
  }

  // 处理error
  void formatError(DioError e) {
    switch (e.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        print('连接超时');
        break;
      case DioErrorType.SEND_TIMEOUT:
        print('请求超时');
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        print('相应超时');
        break;
      case DioErrorType.RESPONSE:
        print('出现异常');
        break;
      case DioErrorType.CANCEL:
        print('请求取消');
        break;
      default :
        break;
    }
  }

  // 取消请求
  void cancelRequests(CancelToken token) {
      token.cancel('cancelled');
  }
}