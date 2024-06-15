// lib/app/bindings/global_binding.dart
import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/controllers/global_controller.dart';
import 'package:mark_jinxiaoman/app/data/appwrite_service.dart';
import 'package:mark_jinxiaoman/app/data/global_state.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalState());
    Get.put(GlobalController());
    Get.put(AppwriteService());
  }
}
//   GlobalBinding().dependencies();  // 绑定全局控制器
