import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 自定义的通用AppBar组件，提供灵活的配置选项
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // AppBar的标题
  final Color? backgroundColor; // AppBar的背景颜色
  final Color? foregroundColor; // AppBar的前景颜色（标题和图标的颜色）
  final bool centerTitle; // 标题是否居中 true: 居中 false: 靠左
  final bool showLeftButton; // 是否显示左侧按钮
  final bool showRightButtons; // 是否显示右侧按钮
  final IconData? leftButtonIcon; // 左侧按钮的图标
  final VoidCallback? onLeftButtonPressed; // 左侧按钮的点击事件
  final List<Widget>? rightButtons; // 右侧按钮的列表

  /// 构造函数
  BaseAppBar({
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.showLeftButton = true,
    this.showRightButtons = false,
    this.leftButtonIcon,
    this.onLeftButtonPressed,
    this.rightButtons,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: foregroundColor ?? (isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      backgroundColor:
          backgroundColor ?? (isDarkMode ? Colors.black : Colors.white),
      centerTitle: centerTitle,
      automaticallyImplyLeading: false, // 防止自动添加返回按钮
      leading: showLeftButton
          ? IconButton(
              icon: Icon(leftButtonIcon ?? Icons.arrow_back),
              onPressed: onLeftButtonPressed ??
                  () {
                    Get.back();
                  },
              color:
                  foregroundColor ?? (isDarkMode ? Colors.white : Colors.black),
            )
          : null,
      actions: showRightButtons ? rightButtons : null,
      iconTheme: IconThemeData(
        color: foregroundColor ?? (isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // AppBar的高度
}
