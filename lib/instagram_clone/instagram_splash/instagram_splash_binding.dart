import 'package:demo/instagram_clone/instagram_splash/instagram_splash_controller.dart';
import 'package:get/get.dart';

class InstagramSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstagramSplashController());
  }
}
