import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/modules/dynamic/views/dynamic_view.dart';
import 'package:mark_jinxiaoman/app/modules/home/views/home_view.dart';
import 'package:mark_jinxiaoman/app/modules/profile/views/profile_view.dart';
import 'package:mark_jinxiaoman/app/modules/tabbar/controllers/tabbar_controller.dart';
import 'package:mark_jinxiaoman/app/utils/intl.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({Key? key}) : super(key: key);

  @override
  _TabbarView createState() => _TabbarView();
}

class _TabbarView extends State<TabbarView> {
  final logic = Get.find<TabbarController>();
  PageController? _pageController; // 修正变量名
  List<Widget> pages = [HomeView(), DynamicView(), ProfileView()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // 初始化PageController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: pages,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // 禁止左右滑动切换
          onPageChanged: (index) {
            logic.selectedIndex.value = index;
          },
        ),
        bottomNavigationBar: Theme(
            data: ThemeData(
              brightness: Brightness.light,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Obx(() => BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: Intl().home),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.dynamic_form), label: Intl().activity),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.supervisor_account),
                        label: Intl().other),
                  ],
                  currentIndex: logic.selectedIndex.value,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                  unselectedItemColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  onTap: _onItemTapped,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                ))));
  }

  void _onItemTapped(int index) {
    _pageController?.jumpToPage(index); // 使用修正后的变量名
  }

  @override
  void dispose() {
    _pageController?.dispose(); // 使用修正后的变量名
    Get.delete<TabbarController>();
    super.dispose();
  }
}
