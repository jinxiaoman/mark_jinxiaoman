import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/MenuItem.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(), // Use default back button
            MenuItem(
              icon: Icons.security,
              text: '账号与安全',
              onTap: () {
                // Navigate to account and security settings
              },
            ),
            MenuItem(
              icon: Icons.privacy_tip,
              text: '隐私设置',
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            MenuItem(
              icon: Icons.notifications,
              text: '通知设置',
              onTap: () {
                // Navigate to notification settings
              },
            ),
            MenuItem(
              icon: Icons.email,
              text: '书信设置',
              onTap: () {
                // Navigate to mail settings
              },
            ),
            MenuItem(
              icon: Icons.article,
              text: '用户协议',
              onTap: () {
                // Show user agreement
              },
            ),
            MenuItem(
              icon: Icons.policy,
              text: '隐私政策',
              onTap: () {
                // Show privacy policy
              },
            ),
            MenuItem(
              icon: Icons.cleaning_services,
              text: '清除缓存',
              trailing: Text('2.40MB'),
              onTap: () {
                // Clear cache
              },
            ),
            Spacer(),
            LogoutButton(
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
