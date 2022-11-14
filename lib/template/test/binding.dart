import 'package:get/get.dart';

import 'provide/logic.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestLogic());
  }
}
