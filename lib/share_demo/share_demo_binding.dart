import 'package:demo/share_demo/share_demo_controller.dart';
import 'package:get/get.dart';

class ShareDemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareDemoController());
  }
}
