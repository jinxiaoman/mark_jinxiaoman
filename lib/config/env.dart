import 'package:flutter/material.dart';

// config/env.dart

class Env {
  static const String baseUrl = "https://www.baidu.com/";
  static const String token = "token";
  static const String userInfo = "user_info";
  static const String localeIndex = "locale_index";
  static const String themeMode = "THEME_MODE";
  static const String isLoggedIn = "IS_LOGGED_IN";
  static const String isFirstEntry = "IS_FIRST";

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  static const Locale fallbackLocale = Locale('en', 'US');
  static const Size designSize = Size(375, 690);
}
