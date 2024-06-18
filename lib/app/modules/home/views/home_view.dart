import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
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
