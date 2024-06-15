// lib/app/controllers/global_controller.dart
import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/data/global_state.dart';

class GlobalController extends GetxController {
  GlobalState globalState = Get.find<GlobalState>();

  void login(String name) {
    globalState.IS_LOGGED_IN.value = true;
  }

  void logout() {
    globalState.IS_LOGGED_IN.value = false;
  }
}
