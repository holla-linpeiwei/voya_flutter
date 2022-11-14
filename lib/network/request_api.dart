import 'dart:async';

import 'package:dio/dio.dart';

import 'api_client.dart';

///rxDart结合Dio的get请求操作
Stream<Map<String, dynamic>> getRequest(String url,
    {Map<String, dynamic> params = const {}, String? specBaseUrl}) {
  var result =
      Stream.fromFuture(_get(url, params: params, specBaseUrl: specBaseUrl));
  return result;
}

Future<Map<String, dynamic>> getFuture(String url,
    {Map<String, dynamic> params = const {}, String? specBaseUrl}) {
  return _get(url, params: params, specBaseUrl: specBaseUrl);
}

///Dio的get请求操作
Future<Map<String, dynamic>> _get(String url,
    {Map<String, dynamic> params = const {}, String? specBaseUrl}) async {
  ApiClient client = ApiClient.getInstance(baseUrl: specBaseUrl);
  var response = await client.dio.get(url, queryParameters: params);
  Map<String, dynamic> data = response.data;
  return data;
}

///rxDart结合Dio的post请求操作
Stream<Map<String, dynamic>> postRequest(String url,
    {dynamic body, String? specBaseUrl}) {
  var result = Stream.fromFuture(_post(url, body, specBaseUrl: specBaseUrl));
  return result;
}

///Dio的post请求操作
Future<Map<String, dynamic>> _post(String url, dynamic body,
    {String? specBaseUrl}) async {
  var response = await ApiClient.getInstance(baseUrl: specBaseUrl)
      .dio
      .post(url, data: body);
  Map<String, dynamic> data = response.data;
  return data;
}

///Dio的put请求操作
Stream<Map<String, dynamic>> putRequest(String url,
    {dynamic body, String? specBaseUrl}) {
  var result = Stream.fromFuture(_put(url, body, specBaseUrl: specBaseUrl));
  return result;
}

///Dio的put请求操作
Future<Map<String, dynamic>> _put(String url, dynamic body,
    {String? specBaseUrl}) async {
  var response = await ApiClient.getInstance(baseUrl: specBaseUrl)
      .dio
      .put(url, data: body);
  Map<String, dynamic> data = response.data;

  return data;
}

///rxDart结合Dio的上传文件请求操作
Stream<Map<String, dynamic>> uploadFile(String url, String filePath) {
  var result = Stream.fromFuture(_uploadFile(url, filePath));
  result.asBroadcastStream();
  return result;
}

///Dio上传文件注：file是服务端接受的字段字段，如果接受字段不是这个需要修改
Future<Map<String, dynamic>> _uploadFile(String url, String filePath) async {
  var fileName =
      filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
  var postData = FormData.fromMap({
    "file": await MultipartFile.fromFile(filePath, filename: fileName)
  }); //file是服务端接受的字段字段，如果接受字段不是这个需要修改
  var option = Options(
      method: "POST",
      contentType: "multipart/form-data"); //上传文件的content-type 表单

  var response = await ApiClient.getInstance().dio.post(
    url,
    data: postData,
    options: option,
    onSendProgress: (int sent, int total) {
//          NumUtil.getNumByValueDouble(sent / total * 100, 2)
//              .toStringAsFixed(2) +
//          "%"); //取精度，如：56.45%
    },
  );
  Map<String, dynamic> data = response.data;

  return data;
}
