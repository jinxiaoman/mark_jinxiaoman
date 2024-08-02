import 'package:flutter/material.dart';

// UserProfileHeader widget
class UserProfileHeader extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final String userId;
  final Color backgroundColor; // 新增背景色属性
  final BorderRadius borderRadius; // 新增圆角属性

  UserProfileHeader({
    required this.avatarUrl,
    required this.username,
    required this.userId,
    this.backgroundColor = Colors.white, // 默认背景色为白色
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)), // 默认圆角半径
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      // Adding padding around the ListTile
      child: Padding(
        padding: EdgeInsets.all(12.0), // Adjust padding as needed
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatarUrl),
              radius: 30,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  userId,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// MenuItem widget
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Widget? trailing;
  final Color backgroundColor;
  final BorderRadius borderRadius;

  MenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
    this.trailing,
    this.backgroundColor = Colors.white,
    this.borderRadius =
        const BorderRadius.all(Radius.circular(12.0)), // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: ListTile(
            leading: Icon(icon),
            title: Text(text),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}

// LogoutButton widget
class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  LogoutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onTap,
        child: Text('退出登录', style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
