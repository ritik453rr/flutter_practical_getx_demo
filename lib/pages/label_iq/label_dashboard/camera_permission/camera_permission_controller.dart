import 'package:get/get.dart';
import 'package:getx_demo/Dialog/app_adaptive_dialog.dart';
import 'package:getx_demo/routing/app_routes.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionController extends GetxController {
  void checkCameraPermission() async {
    final status = await Permission.camera.request();

    if (status.isGranted) {
      // Get.back(); // Close the camera permission view
      Get.toNamed(AppRoutes.scan); // Navigate to the scan page
    } else {
      appAdaptiveDialog(content: "Enable Camera Permission", title: "Permission Denied",
      secondBtnText: "Open Settings",
      onTapSecondBtn: () {
        openAppSettings(); // Open app settings to enable camera permission
      },


      // on: () {
      //   openAppSettings(); // Open app settings to enable camera permission
      // }
      
      );
    }
  }
}
