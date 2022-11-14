///请求成功回调
typedef OnSuccess<T> = void Function(T result);

///请求失败回调
typedef OnFailed = void Function(int code, String errorMsg);
