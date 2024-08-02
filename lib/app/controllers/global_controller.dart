import 'package:get/get.dart';

import 'package:mark_jinxiaoman/app/data/global_state.dart';

// lib/app/controllers/global_controller.dart

class GlobalController extends GetxController {
  GlobalState globalState = Get.find<GlobalState>();

  void login(String name) {
    GlobalState.IS_LOGGED_IN = true;
  }

  void logout() {
    GlobalState.IS_LOGGED_IN = false;
  }
}
