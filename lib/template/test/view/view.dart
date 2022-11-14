import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voya_flutter/common/widget/widget_mixin.dart';

import '../provide/logic.dart';

class TestPage extends StatelessWidget with WidgetMixin {
  final logic = Get.find<TestLogic>();
  final state = Get.find<TestLogic>().state;

  // 懒加载方式，只会创建一次对象
  // final logic = Get.lazyPut(() => TestLogic());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // example列举比较常用的方式
    return _example1();
  }

  Widget _example1() {
    return Obx(() => Text('${logic.count}'));
  }

  /// GetBuilder下所有
  Widget _example2() {
    return GetBuilder<TestLogic>(builder: (_) {
      return Container();
    });
  }
}
