import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/data/toast_service.dart';

void showToast(String message) {
  Get.find<ToastService>().showToast(message: message);
}
