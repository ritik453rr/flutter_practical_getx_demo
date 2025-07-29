import 'package:get/get.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/label_dashboard_controller.dart';

class LabelDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LabelDashboardController());
  }
}
