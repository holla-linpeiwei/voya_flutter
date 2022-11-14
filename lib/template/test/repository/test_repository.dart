
import '../../../common/base/base_repository.dart';
import '../../../network/data_response.dart';

/// @author FanXiuMing
/// @date 2022/11/10 17:16
/// @version
/// @description ()
class TestRepository extends BaseRepository {
  /// 模拟网络请求
  Stream<DataResponse> request() {
    var url = 'xxxx';

    // 特殊接口替换baseUrl
    String specBaseUrl = 'http://api.test.xxx/';

    // 不需要转换成DataResponse的

    // Stream<Map<String, dynamic>> response =
    // getRequest(url, specBaseUrl: specBaseUrl);
    // postRequest(url, specBaseUrl: specBaseUrl);

    // example get请求

    // Stream<DataResponse> result =
    //     get(url, params: const {}, specBaseUrl: specBaseUrl);

    // example post请求

    Stream<DataResponse> result =
        post(url, body: const {}, specBaseUrl: specBaseUrl);

    return result;
  }
}
