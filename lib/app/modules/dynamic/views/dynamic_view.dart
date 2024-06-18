import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/baseAppBar.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/baseWebView.dart';
import 'package:mark_jinxiaoman/generated/locales.g.dart';

import '../controllers/dynamic_controller.dart';

class DynamicView extends GetView<DynamicController> {
  const DynamicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: BaseAppBar(
      //     title: LocaleKeys.titles_settings.tr,
      //     showLeftButton: false,
      //   ),
      body: BaseWebView(
        title: '',
        url: 'https://www.baidu.com',
      ),
    );
  }
}
