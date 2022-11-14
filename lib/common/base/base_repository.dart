
import '../../network/data_response.dart';
import '../../network/network_constant.dart';
import '../../network/request_api.dart';

/// @author FanXiuMing
/// @date 2022/11/10 16:53
/// @version
/// @description ()
abstract class BaseRepository {
  DataResponse parseToDataResponse(Map<String, dynamic> event) {
    var result = event[NetworkConstant.responseResult];
    var message = event[NetworkConstant.responseMsg];
    var data = event[NetworkConstant.responseData];
    return DataResponse(result: result, message: message, data: data);
  }

  /// get请求
  Stream<DataResponse> get(String url,
      {Map<String, dynamic> params = const {}, String? specBaseUrl}) {
    return getRequest(url, params: params, specBaseUrl: specBaseUrl)
        .map((event) => parseToDataResponse(event));
  }

  /// post请求
  Stream<DataResponse> post(String url,
      {dynamic body, String? specBaseUrl}) {
    return postRequest(url, body: body, specBaseUrl: specBaseUrl)
        .map((event) => parseToDataResponse(event));
  }
}
