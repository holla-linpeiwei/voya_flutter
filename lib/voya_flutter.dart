
import 'dart:async';

import 'package:flutter/services.dart';

class VoyaFlutter {
  static const MethodChannel _channel = MethodChannel('voya_flutter');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
