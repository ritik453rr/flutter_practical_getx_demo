import 'package:get/get.dart';
import 'package:getx_demo/routing/app_routes.dart';
import 'package:permission_handler/permission_handler.dart';

class LabelDashboardController extends GetxController {
  var selectedIndex = 0.obs;

  void tabChange(int index) {
    switch (index) {
      case 0:
        selectedIndex.value = 0;
        break;
      case 1:
        checkCameraPermission();
        break;
      case 2:
        selectedIndex.value = 1;
        break;
      default:
        selectedIndex.value = 0;
    }
  }

  void checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      Get.toNamed(AppRoutes.scan);
    } else {
      Get.toNamed(AppRoutes.cameraPermission);
    }
  }
}
