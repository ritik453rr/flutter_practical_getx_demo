import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/camera_permission/camera_permission_controller.dart';

class CameraPermissionBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CameraPermissionController());
  }
}