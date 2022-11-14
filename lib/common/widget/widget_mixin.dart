import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @author FanXiuMing
/// @date 2022/11/11 22:52
/// @version
/// @description (widget函数复用)
mixin WidgetMixin {
  /// widget/state 复用时,需要加上super.build(context)
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Container();
  }
}
