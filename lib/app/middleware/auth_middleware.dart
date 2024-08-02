import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mark_jinxiaoman/config/app_config.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // 这里检查用户是否已登录,可以使用你的认证逻辑
    //bool isLoggedIn = false; // 替换为实际的登录状态检查

    if (!AppConfig.to.isLoggedIn) {
      // 如果未登录,重定向到登录页面
      return RouteSettings(name: '/login');
    }

    // 如果已登录,返回null允许继续导航到目标路由
    return null;
  }
}
