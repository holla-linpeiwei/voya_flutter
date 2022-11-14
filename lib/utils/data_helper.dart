import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:flutter/foundation.dart';

/// @author FanXiuMing
/// @date 2022/11/10 17:17
/// @version
/// @description (参数加密工具)
class DataHelper {
  static encryptParams(Map<String, dynamic> map) {
    var buffer = StringBuffer();
    map.forEach((key, value) {
      buffer.write(key);
      buffer.write(value);
    });

    buffer.write("SERECT");
    var sign = str2MD5(buffer.toString());
    if (kDebugMode) {
      print("sign--->" + sign);
    }
    return sign;
  }

  static str2MD5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
