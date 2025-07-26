import 'package:get/get.dart';
import 'package:getx_demo/pages/label_iq/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
