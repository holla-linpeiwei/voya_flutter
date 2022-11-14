import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor/voya_interceptor.dart';
import 'network_constant.dart';

/// @author FanXiuMing
/// @date 2021/4/8 9:34
/// @version 1.0
/// @description: (网络请求框架)
class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  late Dio dio;

  final connectTimeOut = 30000;
  final receiveTimeout = 30000;

  ApiClient._internal() {
    //初始化
    _initDio();
  }

  _initDio() async {
    createDio();
  }

  createDio() {
    String domainHost = NetworkConstant.baseUrl;

    var log = PrettyDioLogger(
        requestHeader: true, responseBody: true, requestBody: true);

    dio = Dio()
      ..options = BaseOptions(
          baseUrl: domainHost,
          connectTimeout: connectTimeOut,
          receiveTimeout: receiveTimeout)
      ..interceptors.add(VoyaInterceptor())
      ..interceptors.add(log);
  }

  static ApiClient getInstance({String? baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  /// 指定特定域名
  ApiClient _baseUrl(String baseUrl) {
    dio.options.baseUrl = baseUrl;
    return this;
  }

  /// 默认域名
  ApiClient _normal() {
    if (dio.options.baseUrl != NetworkConstant.baseUrl) {
      dio.options.baseUrl = NetworkConstant.baseUrl;
    }
    return this;
  }
}
