import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voya_flutter/common/extension/string_extension.dart';

import 'common/locale/application.dart';
import 'common/locale/translation.dart';
import 'utils/log_utils.dart';
import 'views/empty/empty_page.dart';

/// @author FanXiuMing
/// @date 2022/11/11 16:26
/// @version
/// @description ()

/// 用于获取全局context
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// 全局初始化
init() async {
  LogUtils.init(tag: 'voya_flutter', isDebug: kDebugMode);
  await ScreenUtil.ensureScreenSize();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  late SpecificLocalizationDelegate _localeOverrideDelegate;

  final String _toNamed = "1";
  final String _offNamed = "2";
  final String _offAllNamed = "3";

  /// 监听页面显示&返回信息
  ///
  /// 约定跳转格式{"type":"","url":"/testPage/xxx/"}
  /// url参数可灵活构造，/testPage/:id?key1=xxx&key2=xxx
  /// type-跳转方式
  ///   "1"：Get.toNamed
  ///   "2":Get.offNamed
  ///   "3":Get.offAllNamed
  static const _widgetChannel = MethodChannel('flutter.voya.methodChannel');

  /// 向移动端传递页面操作信息&接收网络参数
  static const _messageChannel =
      BasicMessageChannel('flutter_voya_basicchannel', StandardMessageCodec());

  // StreamSubscription<int> _invalidTokenSubscription;

  /// 监听原生端主动发送的消息
  void _receiveMessage() {
    _messageChannel.setMessageHandler((result) async {
      if (kDebugMode) {
        LogUtils.d("收到 BasicMessageChannel 消息：" + result.toString());
      }
      return 'Flutter 已收到消息 ：$result';
    });

    _widgetChannel.setMethodCallHandler((call) async {
      if (kDebugMode) {
        LogUtils.d("widgetChannel收到" + call.method);
      }

      // 解析原生传递的参数
      String type = '1';
      String url = '';
      if (type == _toNamed) {
        Get.toNamed(url);
      } else if (type == _offNamed) {
        Get.offNamed(url);
      } else {
        Get.offAllNamed(url);
      }

      return null;
    });
  }

  @override
  void initState() {
    super.initState();

    _receiveMessage();

    /// 切换时，可以强制初始化一个新的Translations
    _localeOverrideDelegate = SpecificLocalizationDelegate(null);

    /// appLic.onLocaleChanged(new Locale('en','')) 强制刷新App切换语言
    appLic.onLocaleChanged = (locale) {
      setState(() {
        _localeOverrideDelegate = SpecificLocalizationDelegate(locale);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        _localeOverrideDelegate,
        const TranslationsDelegate(), // 指向默认的处理翻译逻辑的库
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: appLic.supportedLocales(),

      navigatorKey: navigatorKey,
      builder: EasyLoading.init(builder: (ctx, child) {
        ScreenUtil.init(ctx);
        return child!;
      }),

      initialRoute: '/',
      unknownRoute: GetPage(name: '/', page: () => EmptyPage()),
      //初始化的时候加载的路由
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
      ],
      // onGenerateRoute: onGenerateRoute,
      // navigatorObservers: [
      //   navigationObserver,
      // ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String test = 'test'.i18n();
    return Align(
      child: Text('Flutter Project $test'),
    );
  }
}
