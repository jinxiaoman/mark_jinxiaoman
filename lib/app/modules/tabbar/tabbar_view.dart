import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mark_jinxiaoman/app/modules/dynamic/dynamic_view.dart';
import 'package:mark_jinxiaoman/app/modules/home/home_view.dart';
import 'package:mark_jinxiaoman/app/modules/profile/profile_view.dart';
import 'package:mark_jinxiaoman/app/modules/tabbar/tabbar_controller.dart';
import 'package:mark_jinxiaoman/generated/locales.g.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({Key? key}) : super(key: key);

  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  final TabbarController tabbarController = Get.find<TabbarController>();
  final PageController _pageController = PageController();
  final List<Widget> pages = [HomeView(), DynamicView(), ProfileView()];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // 禁止左右滑动切换
        onPageChanged: (index) {
          tabbarController.selectedIndex.value = index;
        },
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Obx(
          () => BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: LocaleKeys.tabbar_home.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dynamic_form),
                label: LocaleKeys.tabbar_setting.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account),
                label: LocaleKeys.tabbar_profile.tr,
              ),
            ],
            currentIndex: tabbarController.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            onTap: _onItemTapped,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index); // 使用修正后的变量名
  }
}
