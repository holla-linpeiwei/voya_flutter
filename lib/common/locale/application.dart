import 'package:flutter/material.dart';

/// @author FanXiuMing
/// @date 2022/11/11 14:35
/// @version
/// @description ()
typedef LocaleChangeCallback = void Function(Locale? locale);

class AppLic {
  // List of supported languages
  final List<String> supportedLanguages = [
    'en',
    'zh',
    'ar',
    'de',
    'es',
    'fr',
    'hi',
    'id',
    'in',
    'it',
    'ja',
    'ko',
    'pt',
    'ro',
    'ru',
    'th',
    'tr',
    'vi',
    'zh-rTW'
  ];

  // Returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguages.map<Locale>((lang) => Locale(lang, ''));

  // Function to be invoked when changing the working language
  LocaleChangeCallback? onLocaleChanged;

  ///
  /// Internals
  ///
  static final AppLic _appLic = AppLic._internal();

  factory AppLic() {
    return _appLic;
  }

  AppLic._internal();
}

AppLic appLic = AppLic();
