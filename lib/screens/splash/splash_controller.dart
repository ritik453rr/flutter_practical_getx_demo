import 'package:get/get.dart';
import 'package:getx_demo/routing/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigation();
  }

  void navigation() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.routeVerifyPhone);
    });
  }
}
