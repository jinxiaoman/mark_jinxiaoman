import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/MenuItem.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/MenuItemGroup.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人'),
        centerTitle: true,
        backgroundColor: Color(0xFFF2F2F3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileHeader(
              avatarUrl:
                  'assets/images/avatar_placeholder.png', // Replace with actual avatar URL
              username: '野生的鸽子',
              userId: '角落 ID: 100142',
            ),
            SizedBox(height: 20),
            MenuItem(
              icon: Icons.people,
              text: '角落社区',
              onTap: () {
                // Navigate to the community screen
              },
            ),
            SizedBox(height: 20),
            MenuItemGroup(items: [
              MenuItem(
                icon: Icons.star,
                text: 'Plus 会员',
                onTap: () {
                  // Navigate to the membership screen
                },
              ),
              MenuItem(
                icon: Icons.feedback,
                text: '建议与反馈',
                onTap: () {
                  // Navigate to the feedback screen
                },
              ),
              MenuItem(
                icon: Icons.share,
                text: '分享给朋友',
                onTap: () {
                  // Share app with friends
                },
              ),
              MenuItem(
                icon: Icons.info,
                text: '关于',
                onTap: () {
                  // Show about information
                },
              ),
            ]),
            Spacer(),
            Text(
              'v1.3.3',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
