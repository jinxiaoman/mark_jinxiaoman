import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mark_jinxiaoman/config/env.dart';

// config/app_config.dart

class AppConfig {
  static SharedPreferences? _prefs;

  static Future<bool> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs != null;
  }

  static void saveFirstEntry() {
    _prefs?.setBool(Env.isFirstEntry, false);
  }

  static bool isFirstEntry() {
    return _prefs?.getBool(Env.isFirstEntry) ?? true;
  }

  static void saveLoginStatus(bool isLoggedIn) {
    _prefs?.setBool(Env.isLoggedIn, isLoggedIn);
  }

  static bool isUserLoggedIn() {
    return _prefs?.getBool(Env.isLoggedIn) ?? false;
  }

  static void saveToken(String token) {
    _prefs?.setString(Env.token, token);
  }

  static String? getToken() {
    return _prefs?.getString(Env.token);
  }

  static void saveUserInfo(Map<String, dynamic> userInfo) {
    _prefs?.setString(Env.userInfo, userInfo.toString());
  }

  static Map<String, dynamic>? getUserInfo() {
    String? userInfoString = _prefs?.getString(Env.userInfo);
    return userInfoString != null
        ? Map<String, dynamic>.from(jsonDecode(userInfoString))
        : null;
  }

  static void saveThemeMode(ThemeMode themeMode) {
    _prefs?.setString(Env.themeMode, themeMode.toString());
  }

  static ThemeMode getThemeMode() {
    String? themeModeString = _prefs?.getString(Env.themeMode);
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

  static void changeLanguage(Locale locale) async {
    Get.updateLocale(locale);
    await _prefs?.setString(
        'locale', '${locale.languageCode}_${locale.countryCode}');
  }

  static Future<Locale> getCurrentLocale() async {
    String localeCode = _prefs?.getString('locale') ?? 'zh_CN';
    return Locale(localeCode.split('_')[0], localeCode.split('_')[1]);
  }
}
