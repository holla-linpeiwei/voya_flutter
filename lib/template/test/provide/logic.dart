import 'package:get/get.dart';

import '../../../common/base/base_provide.dart';
import '../repository/test_repository.dart';
import '../state.dart';

class TestLogic extends BaseProvide {
  final TestState state = TestState();

  final TestRepository _repository = TestRepository();

  Rx<double> count = Rx<double>(0);

  // var count = 0.obs;

  testRequest() {
    var observable = _repository.request();
    resolveServiceResult(observable, (result) {
      count++;
      // 局部刷新
      update();
    }, (code, errorMsg) {
    });
  }
}
