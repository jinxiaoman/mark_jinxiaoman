import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/data/app_data.dart';
import 'package:permission_handler/permission_handler.dart';

class TabbarController extends GetxController {
  //TODO: Implement TabbarController

  var selectedIndex = 0.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> checkPermission(BuildContext context) async {
    ///android权限申请需要在AndroidManifest.xml里添加对应的权限声明
    ///iOS
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.storage,
    ].request();
    statuses.forEach((key, value) {
      if (value.isDenied) {
        ///被拒绝了
        // showToast('permissionDenied'.tr);
        return;
      }
    });
  }
}
