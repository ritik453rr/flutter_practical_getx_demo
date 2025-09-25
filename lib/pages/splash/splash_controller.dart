import 'package:get/get.dart';
import 'package:getx_demo/routing/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.googleMap);
    });
  }
}
