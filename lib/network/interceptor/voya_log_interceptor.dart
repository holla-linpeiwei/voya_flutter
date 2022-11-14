import 'package:dio/dio.dart';

/// @author FanXiuMing
/// @date 2022/11/10 14:42
/// @version 1.0
/// @description: (日志拦截器)
class VoyaLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return super.onRequest(options, handler);
  }
}
