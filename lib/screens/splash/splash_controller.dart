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
    Future.delayed(const Duration(seconds: 2), () async {
      if (await Global.checkInternetConnection()) {
        Get.toNamed(AppRoutes.routeVerifyPhone);
      } else {
        print("No Internet....");
      }
    });
  }
}
