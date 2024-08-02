import 'package:get/get.dart';

// lib/app/data/global_state.dart

class GlobalState extends GetxController {
  var IS_NEW_USER = false.obs;
  var USER_NAME = ''.obs;
  var TAB_BAR_SELECTED_INDEX = 0.obs;

  static const base_url = "https://www.baidu.com/";
  static const String TOKEN = "token";
  static const String USER_INFO = "user_info";
  static const String LOCALE_INDEX = "locale_index";
  static const String THEME_MODE = "THEME_MODE";
  static bool IS_LOGGED_IN = false;
}
