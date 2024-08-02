import 'package:get/get.dart';

import 'package:mark_jinxiaoman/app/services/loading_service.dart';

class Loading {
  static void show([String? message]) {
    Get.find<LoadingService>().showLoading(message: message);
  }

  static void hind() {
    Get.find<LoadingService>().dismissLoading();
  }
}
