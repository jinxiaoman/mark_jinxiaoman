import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/data/global_state.dart';
import 'package:mark_jinxiaoman/app/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static SharedPreferences? prefs;

  static Future<bool> initData() async {
    prefs = await SharedPreferences.getInstance();
    AppLogger.i("初始化完成${DateTime.now().toString()} ${prefs != null}");
    return Future.value(prefs != null);
  }

  // 保存是否第一次进入
  static void saveFirstEntry() {
    prefs?.setBool('IS_FIRST', false);
  }

  // 是否第一次进入
  static bool isFirstEntry() {
    return prefs?.getBool('IS_FIRST') ?? true;
  }

  // 保存登录状态
  static void saveLoginStatus(bool isLoggedIn) {
    prefs?.setBool(GlobalState.IS_LOGGED_IN as String, isLoggedIn);
  }

  // 查询登录状态
  static bool isUserLoggedIn() {
    return prefs?.getBool(GlobalState.IS_LOGGED_IN as String) ?? false;
  }

  // 保存Token
  static void saveToken(String token) {
    prefs?.setString(GlobalState.TOKEN, token);
  }

  // 查询Token
  static String? getToken() {
    return prefs?.getString(GlobalState.TOKEN);
  }

  // 保存用户基本信息
  static void saveUserInfo(Map<String, dynamic> userInfo) {
    prefs?.setString(GlobalState.USER_INFO, userInfo.toString());
  }

  // 查询用户基本信息
  static Map<String, dynamic>? getUserInfo() {
    String? userInfoString = prefs?.getString(GlobalState.USER_INFO);
    if (userInfoString != null) {
      // 假设 userInfo 是一个 JSON 字符串
      return Map<String, dynamic>.from(jsonDecode(userInfoString));
    }
    return null;
  }

  // 保存主题模式
  static void saveThemeMode(ThemeMode themeMode) {
    prefs?.setString(GlobalState.THEME_MODE, themeMode.toString());
    print('Saved theme mode: $themeMode'); // 添加调试日志
  }

  // 查询主题模式
  static ThemeMode getThemeMode() {
    String? themeModeString = prefs?.getString(GlobalState.THEME_MODE);
    print('Loaded theme mode: $themeModeString'); // 添加调试日志
    switch (themeModeString) {
      case "ThemeMode.dark":
        return ThemeMode.dark;
      case "ThemeMode.light":
        return ThemeMode.light;
      case "ThemeMode.system":
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  // 切换国际化语言
  static void changeLanguage(Locale locale) async {
    Get.updateLocale(locale);
    await prefs?.setString(
        'locale', '${locale.languageCode}_${locale.countryCode}');
  }
  // 示例 AppData.changeLanguage(Locale('zh', 'CN'));

  // 查询国际化语言
  static Future<Locale> getCurrentLocale() async {
    String localeCode = prefs?.getString('locale') ?? 'zh_CN';
    return Locale(localeCode.split('_')[0], localeCode.split('_')[1]);
  }
}
