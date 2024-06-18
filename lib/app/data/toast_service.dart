import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

// Toast 服务, 创建一个单例的 ToastService，并使用 GetX 的依赖注入功能来全局注册它。
class ToastService extends GetxService {
  late BuildContext _context;

  // 初始化方法，用于注入 BuildContext
  void init(BuildContext context) {
    _context = context;
  }

  void showToast({
    required String message,
    String? position = 'center',
    // ToastGravity gravity = ToastGravity.CENTER,
    double fontSize = 16.0,
    int toastLength = 1, // 1 for short, 2 for long
  }) {
    final theme = Theme.of(_context);
    final backgroundColor =
        theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.black;
    final textColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.white;

    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength == 1 ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: position == 'center'
          ? ToastGravity.CENTER
          : position == 'top'
              ? ToastGravity.TOP
              : ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
