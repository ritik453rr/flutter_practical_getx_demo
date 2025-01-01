import 'package:get/get.dart';
import 'package:getx_demo/pages/start_page/start_page_controller.dart';

class StartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartPageController());
  }
}
