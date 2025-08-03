import 'package:get/get.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/scan/scan_controller.dart';

class ScanBindig extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanController());
  }
}