import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dynamic_controller.dart';

class DynamicView extends GetView<DynamicController> {
  const DynamicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DynamicView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DynamicView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
