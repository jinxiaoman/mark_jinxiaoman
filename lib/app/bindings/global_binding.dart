import 'package:get/get.dart';

import 'package:mark_jinxiaoman/app/controllers/global_controller.dart';
import 'package:mark_jinxiaoman/app/services/loading_service.dart';
import 'package:mark_jinxiaoman/app/services/toast_service.dart';

// lib/app/bindings/global_binding.dart

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
    Get.put(ToastService()); // 注册 ToastService
    Get.put(LoadingService()); // 注册 LoadingService
  }
}
//   GlobalBinding().dependencies();  // 绑定全局控制器
// 获取AppwriteService实例
// final AppwriteService appwriteService = Get.find<AppwriteService>();

// 获取全局状态控制器
// final GlobalState globalState = Get.find<GlobalState>();
// Get.find<GlobalController>().login('John Doe');
