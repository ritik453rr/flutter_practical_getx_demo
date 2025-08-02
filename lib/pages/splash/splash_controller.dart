import 'package:get/get.dart';
import 'package:getx_demo/common/app_storage.dart';
import 'package:getx_demo/database/database_quries.dart';
import 'package:getx_demo/global.dart';
import 'package:getx_demo/routing/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Global.initDatabase();
    // DatabaseQuries.deldePrefsTable();

    Future.delayed(const Duration(seconds: 2), () async {
      navigation();
    });
  }

  void navigation() {
    if (AppStorage.prefsStatus()) {
      Get.offNamed(AppRoutes.labelPreferences);
    } else {
      Get.offNamed(AppRoutes.labelWelcome);
    }
  }
}
