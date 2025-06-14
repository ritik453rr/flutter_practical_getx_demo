import 'package:get/get.dart';
import 'package:getx_demo/common/app_constants.dart';
import 'package:getx_demo/routing/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigation();
  }

  void navigation() {
    Future.delayed(const Duration(seconds: 2), () async {
      if (await AppConstants.checkInternetConnection()) {
        Get.toNamed(AppRoutes.login);
      } else {
        print("No Internet....");
      }
    });
  }
}
