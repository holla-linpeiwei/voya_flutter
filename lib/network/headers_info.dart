/// @author FanXiuMing
/// @date 2022/11/11 21:17
/// @version
/// @description (请求头部信息，flutter模块初始化时读取原生项目的headers数据)
class HeadersInfo {
  static final HeadersInfo _instance = HeadersInfo._internal();

  factory HeadersInfo() => _instance;

  static final HeadersInfo instance = _instance;

  HeadersInfo._internal();

  /// 请求头部信息
  final Map<String, dynamic> headers = {};
}
