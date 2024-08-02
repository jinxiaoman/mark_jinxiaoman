import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mark_jinxiaoman/app/modules/register/register_controller.dart';
import 'package:mark_jinxiaoman/app/routes/app_pages.dart';

/// @description:
/// @author
/// @date: 2024-06-15 15:31:43
class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

//   final LoginController logic = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final _isPasswordVisible = false.obs;

    // final String assetLogo = 'assets/images/login/logo.svg';
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              //   SvgPicture.asset(
              //     'assets/images/login/logo.svg', // 确保SVG文件在assets文件夹中
              //     height: 80,
              //   ),
              const SizedBox(height: 16.0),

              // 标题
              const Text(
                '注册',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),

              // 副标题
              const Text(
                'Enter your name and password',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32.0),

              // name输入框
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16.0),

              // email输入框
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),

              // Password输入框
              Obx(() => TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          _isPasswordVisible.value = !_isPasswordVisible.value;
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible.value,
                  )),
              const SizedBox(height: 16.0),

              // 有账号去登录
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // 处理忘记密码逻辑
                    print('直接去登录');
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: const Text('有账号?，直接去登录'),
                ),
              ),
              const SizedBox(height: 16.0),

              // 登录按钮
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            controller.register(
                              _emailController.text,
                              _nameController.text,
                              _passwordController.text,
                            );
                          },
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('点击注册'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48), // 匹配父组件宽度
                    ),
                  )),
              const SizedBox(height: 16.0),

              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       const Expanded(
              //         child: Text("Don't have an account? "),
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           // 跳转到注册页面
              //           Get.offAllNamed(Routes.REGISTER);
              //         },
              //         child: const Text(
              //           'Signup',
              //           style: TextStyle(
              //             color: Colors.green,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ],
              //   )
            ],
          ),
        ),
      ),
    );
  }
}
