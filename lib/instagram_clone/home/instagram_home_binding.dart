import 'package:demo/instagram_clone/home/instagram_home_controller.dart';
import 'package:get/get.dart';

class InstagramHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InstagramHomeController(),
    );
  }
}
