import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mark_jinxiaoman/app/ui/widgets/base_app_bar.dart';
import 'package:mark_jinxiaoman/app/ui/widgets/base_web_view.dart';
import 'package:mark_jinxiaoman/generated/locales.g.dart';

import 'dynamic_controller.dart';

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
