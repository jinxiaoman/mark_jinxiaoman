import 'package:flutter/material.dart';

// 导入 Flutter 的 Material 包

// 自定义输入字段组件
class CustomInputField extends StatefulWidget {
  // 字段定义
  final String labelText; // 标签文本
  final String hintText; // 提示文本
  final String? Function(String?) validator; // 验证器函数
  final bool suffixIcon; // 是否显示后缀图标
  final bool? isDense; // 是否紧凑布局
  final bool obscureText; // 是否隐藏文本（用于密码）
  final TextEditingController? controller; // 文本控制器
  final TextInputType keyboardType; // 键盘类型
  final int? maxLength; // 最大长度
  final bool isEmail; // 是否为电子邮件输入
  final bool isPhone; // 是否为电话号码输入
  final FocusNode? focusNode; // 焦点节点

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.validator,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.isEmail = false,
    this.isPhone = false,
    this.focusNode,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true; // 控制密码是否隐藏

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // 获取屏幕尺寸
    return Container(
      width: size.width * 0.9, // 设置容器宽度为屏幕宽度的 90%
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3), // 容器内边距
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft, // 左对齐
            child: Text(
              widget.labelText, // 显示标签文本
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), // 样式
            ),
          ),
          TextFormField(
            controller: widget.controller, // 设置控制器
            obscureText: (widget.obscureText && _obscureText), // 控制是否隐藏文本
            keyboardType: widget.keyboardType, // 设置键盘类型
            maxLength: widget.maxLength, // 设置最大长度
            focusNode: widget.focusNode, // 设置焦点节点
            decoration: InputDecoration(
              isDense:
                  (widget.isDense != null) ? widget.isDense : false, // 设置是否紧凑布局
              hintText: widget.hintText, // 提示文本
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined, // 图标
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText; // 切换隐藏状态
                        });
                      },
                    )
                  : null,
              suffixIconConstraints: (widget.isDense != null)
                  ? const BoxConstraints(maxHeight: 33) // 设置后缀图标的最大高度
                  : null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction, // 自动验证模式
            validator: (value) {
              if (widget.isEmail &&
                  value != null &&
                  !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return '请输入有效的电子邮件地址'; // 验证电子邮件
              }
              if (widget.isPhone &&
                  value != null &&
                  !RegExp(r'^\d{10,15}$').hasMatch(value)) {
                return '请输入有效的电话号码'; // 验证电话号码
              }
              return widget.validator(value); // 调用自定义验证器
            },
          ),
        ],
      ),
    );
  }
}
