import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mark_jinxiaoman/config/app_config.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final isSwitched = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void switchChanged(bool value) {
    print(value);
    isSwitched.value = value;
    value
        ? AppConfig.to.currentLocale = Locale('zh', 'CN')
        : AppConfig.to.currentLocale = Locale('en', 'US');
  }

  void changeTheme() {
    ThemeMode newThemeMode = Get.theme.brightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    Get.changeThemeMode(newThemeMode);
    AppConfig.to.themeMode = newThemeMode;
  }
}
