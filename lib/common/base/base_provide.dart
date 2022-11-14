import 'dart:async';

import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../network/code.dart';
import '../../network/data_response.dart';
import '../../network/request_call_back.dart';

/// @author FanXiuMing
/// @date 2022/11/10 16:49
/// @version
/// @description ()
abstract class BaseProvide extends GetxController {
  CompositeSubscription compositeSubscription = CompositeSubscription();

  @override
  void onInit() {
    super.onInit();
    // 初始化
  }

  @override
  void onReady() {
    super.onReady();
    // 加载完成
  }

  @override
  void onClose() {
    super.onClose();
    compositeSubscription.clear();
  }

  /// add [StreamSubscription] to [compositeSubscription]
  ///
  /// 在 [dispose]的时候能进行取消
  addSubscription(StreamSubscription subscription) {
    compositeSubscription.add(subscription);
  }

  ///[Stream] 转换为[StreamSubscription]
  ///
  ///1.根据可选参数isShowLoading加载过程中显示loading
  ///2.处理异常
  resolveServiceResult(Stream<DataResponse> observable,
      OnSuccess<dynamic> requestSuccess, OnFailed requestError,
      {bool isShowLoading = true}) {
    observable
        .map<dynamic>((event) {
          return event;
        })
        .doOnListen(() {})
        .listen((event) {
          _onResponse(event, requestSuccess, requestError);
        }, onError: (error) {
          _onError(requestError, error);
        })
        .addTo(compositeSubscription);
  }

  _onResponse(
    DataResponse data,
    OnSuccess<dynamic> requestSuccess,
    OnFailed requestError,
  ) {
    if (data.result == Code.success) {
      _onSuccess(requestSuccess, data);
      return;
    }
    // 其他异常状态，包括token失效、请求失败等
    _onError(requestError, data.message);
  }

  ///异常捕获
  _onError(OnFailed requestError, error) {
    if (compositeSubscription.isDisposed) {
      return;
    }

    // todo:token失效处理

    //服务器异常
    requestError.call(Code.failure, error.toString());
  }

  _onSuccess(OnSuccess<dynamic> requestSuccess, DataResponse data) {
    if (!compositeSubscription.isDisposed) {
      requestSuccess.call(data.data);
    }
  }
}
