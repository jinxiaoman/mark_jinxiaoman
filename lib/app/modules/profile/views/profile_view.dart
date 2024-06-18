import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/baseAppBar.dart';
import 'package:mark_jinxiaoman/app/utils/loading.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/MenuItem.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/MenuItemGroup.dart';
import 'package:mark_jinxiaoman/app/utils/showToast.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '个人',
        showLeftButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileHeader(
              avatarUrl:
                  'assets/images/avatar_placeholder.png', // Replace with actual avatar URL
              username: '鸽子',
              userId: '角落 ID: 100142',
            ),
            SizedBox(height: 20),
            MenuItem(
              icon: Icons.people,
              text: '角落社区',
              onTap: () {
                Loading.show();
                Future.delayed(Duration(seconds: 5), () {
                  Loading.hind();
                });
                // Navigate to the community screen
              },
            ),
            SizedBox(height: 20),
            MenuItemGroup(items: [
              MenuItem(
                icon: Icons.star,
                text: 'Plus 会员',
                onTap: () {
                  showToast('Plus 会员');
                  // Navigate to the membership screen
                },
              ),
              MenuItem(
                icon: Icons.feedback,
                text: '建议与反馈',
                onTap: () {
                  showToast('建议与反馈');
                  // Navigate to the feedback screen
                },
              ),
              MenuItem(
                icon: Icons.share,
                text: '分享给朋友',
                onTap: () {
                  showToast('分享给朋友');
                  // Share app with friends
                },
              ),
              MenuItem(
                icon: Icons.info,
                text: '关于',
                onTap: () {
                  showToast('关于');
                  // Show about information
                },
              ),
            ]),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '角落 v1.0.0',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
