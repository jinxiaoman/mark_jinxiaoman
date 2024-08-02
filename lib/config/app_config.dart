import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppConfig extends GetxController {
  static AppConfig get to => Get.find();

  final _box = GetStorage();

  // API Related
  final String baseUrl = 'https://www.baidu.com/';

  // Localization
  final List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];
  final Locale fallbackLocale = const Locale('en', 'US');

  // Design
  final Size designSize = const Size(375, 690);

  // Getters and Setters for dynamic values
  bool get isFirstEntry => _box.read('isFirstEntry') ?? true;
  set isFirstEntry(bool value) => _box.write('isFirstEntry', value);

  bool get isLoggedIn => _box.read('isLoggedIn') ?? false;
  set isLoggedIn(bool value) => _box.write('isLoggedIn', value);

  String? get token => _box.read('token');
  set token(String? value) => _box.write('token', value);

  Map<String, dynamic>? get userInfo => _box.read('userInfo');
  set userInfo(Map<String, dynamic>? value) => _box.write('userInfo', value);

  ThemeMode get themeMode {
    String? mode = _box.read('themeMode');
    switch (mode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  set themeMode(ThemeMode mode) =>
      _box.write('themeMode', mode.toString().split('.').last);

  Locale get currentLocale {
    String? localeString = _box.read('locale');
    if (localeString != null) {
      List<String> parts = localeString.split('_');
      return Locale(parts[0], parts[1]);
    }
    return fallbackLocale;
  }

  set currentLocale(Locale locale) {
    _box.write('locale', '${locale.languageCode}_${locale.countryCode}');
    Get.updateLocale(locale);
  }

  // Initialize the config
  Future<void> init() async {
    await GetStorage.init();
    // You can set default values here if needed
    if (!_box.hasData('isFirstEntry')) {
      isFirstEntry = true;
    }
  }

  // Method to reset all stored data (useful for logout)
  void resetAll() {
    _box.erase();
    isFirstEntry = true;
    isLoggedIn = false;
    token = null;
    userInfo = null;
    themeMode = ThemeMode.system;
    currentLocale = fallbackLocale;
  }
}
