import 'package:get/get.dart';
import 'package:getx_demo/screens/refresh_page/refresh_page_controller.dart';

class RefreshPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RefreshPageController>(() => RefreshPageController());
  }
}