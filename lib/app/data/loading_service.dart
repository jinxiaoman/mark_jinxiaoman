import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class LoadingService extends GetxService {
  late BuildContext _context;

  /// 初始化上下文
  void init(BuildContext context) {
    _context = context;
  }

  /// 显示加载中的提示
  ///
  /// [message] 可选的加载提示信息
  void showLoading({String? message, bool allowTouchThrough = false}) {
    final ThemeData theme = Theme.of(_context);

    showToastWidget(
      _buildLoadingWidget(
        message,
        theme.colorScheme.surface,
        theme.textTheme.bodyLarge?.color,
        theme.colorScheme.primary,
        allowTouchThrough,
      ),
      duration: Duration(seconds: 3),
      position: ToastPosition.center,
      dismissOtherToast: true,
      handleTouch: true, // 允许处理触摸事件
      onDismiss: () {},
    );
  }

  /// 构建加载中的提示组件
  ///
  /// [message] 提示信息
  /// [backgroundColor] 背景颜色
  /// [textColor] 文本颜色
  /// [loadingColor] 加载指示器颜色
  /// [allowTouchThrough] 是否允许点击穿透
  Widget _buildLoadingWidget(String? message, Color? backgroundColor,
      Color? textColor, Color? loadingColor, bool allowTouchThrough) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (!allowTouchThrough) {
              // 阻止点击事件
            }
          },
          child: Container(
            color: allowTouchThrough
                ? Colors.transparent
                : Colors.black.withOpacity(0.1), // 浅色背景蒙版
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Center(
          child: AbsorbPointer(
            absorbing: !allowTouchThrough,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        loadingColor ?? Colors.white),
                  ),
                  //   SizedBox(width: 16.0),
                  //   Text(
                  //     message ?? '',
                  //     style: TextStyle(color: textColor ?? Colors.white),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 取消加载中的提示
  void dismissLoading() {
    dismissAllToast();
  }
}
