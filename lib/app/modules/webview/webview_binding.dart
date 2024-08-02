import 'package:get/get.dart';

import 'webview_controller.dart';

class WebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewController>(
      () => WebviewController(),
    );
  }
}
