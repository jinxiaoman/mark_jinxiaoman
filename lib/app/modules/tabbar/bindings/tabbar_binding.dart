import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/modules/dynamic/controllers/dynamic_controller.dart';
import 'package:mark_jinxiaoman/app/modules/home/controllers/home_controller.dart';
import 'package:mark_jinxiaoman/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/tabbar_controller.dart';

class TabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarController>(
      () => TabbarController(),
    );
    // 注册 HomeView 需要的 HomeController
    Get.lazyPut<HomeController>(() => HomeController());

    // 注册 DynamicView 需要的 DynamicController
    Get.lazyPut<DynamicController>(() => DynamicController());

    // 注册 ProfileView 需要的 ProfileController
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
