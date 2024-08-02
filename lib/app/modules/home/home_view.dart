import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mark_jinxiaoman/app/modules/home/home_controller.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/base_app_bar.dart';
import 'package:mark_jinxiaoman/generated/locales.g.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController()); 这里注销，因为在 TabbarBinding 中已经注册了 HomeController。正常情况下是已经注册了的，因为这个是子页面，通过路由进来会注册的。
    return Scaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.titles_home.tr,
        showLeftButton: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), // 添加一些间距
            Obx(() => Text(
                  "${controller.isSwitched.value}",
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                controller.isSwitched.toggle(); // 切换开关状态
                controller.switchChanged(controller.isSwitched.value);
              },
              child: const Text('Toggle Switch'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeTheme();
              },
              child: const Text('Change Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
