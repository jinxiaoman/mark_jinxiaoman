import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void login(name, password) async {
    isLoading.value = true;
    String email = "123@123.com";
    try {
      // 进行登录逻辑，例如调用接口验证用户名密码
      await Future.delayed(Duration(seconds: 2)); // 模拟登录过程

      //   var result = await appwriteService.createUser(email, password, name);
      //   print('User created: ${result}');

      // 登录成功的处理
      isLoggedIn.value = true;
      isLoading.value = false;
      // get 跳转首页
      Get.offAllNamed('/webview');
    } catch (e) {
      // 登录失败的处理
      print('Login failed: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
