import 'package:demo/instagram_clone/instagram_dashboard/instagram_dashboard_controller.dart';
import 'package:get/get.dart';

class InstagramDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstagramDashboardController());
  }
}
