import 'package:get/get.dart';
import 'package:getx_demo/screens/splash/splash_controller.dart';

class SplashBinding extends Bindings  {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}