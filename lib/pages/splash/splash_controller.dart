import 'package:get/get.dart';
import 'package:getx_demo/global.dart';
import 'package:getx_demo/routing/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigation();
  }

  void navigation() {
    Global.initDatabase();
    Future.delayed(const Duration(seconds: 2), () async {
      Get.toNamed(AppRoutes.labelOnboarding);
    });
  }

 
}
