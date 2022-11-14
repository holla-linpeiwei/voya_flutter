import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:voya_flutter/network/data_response.dart';
import 'package:voya_flutter/network/headers_info.dart';

import '../code.dart';

/// @author FanXiuMing
/// @date 2021/4/13 10:44
/// @version 1.0
/// @description: ()
class VoyaInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(HeadersInfo.instance.headers);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    DataResponse dataResponse = DataResponse.fromJson(
        Map<String, dynamic>.from(jsonDecode(response.data)));
    if (dataResponse.result == Code.invalidToken) {
      // token失效
      
    }
    super.onResponse(response, handler);
  }
}
