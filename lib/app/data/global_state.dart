// lib/app/data/global_state.dart
import 'package:get/get.dart';

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

  // Appwrite
  static const String appName = "Flutter Appwrite Starter";
  static const String appNameDev = "[DEV] Flutter Appwrite Starter";
  static const String endpoint = "http://114.132.46.101:18870/v1";
  static const String projectId = "666b0339002644fd57d6";
  static const String databaseId = "666ba2b00019c7a77063";
  static const String profileBucketId = '666bbb09001efc8d2ab7';
}
