import 'package:demo/instagram_clone/common/instagram_keys.dart';
import 'package:demo/instagram_clone/instagram_routing/instagram_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InstagramSplashController extends GetxController {
  @override
  void onInit() {
    // Initiates navigation when the controller is initialized.
    navigation();
    super.onInit();
  }

  /// Navigates to the login screen after a 1-second delay.
  void navigation() async {
    final isLogged = GetStorage().read(InstagramKeys.isLogged) ?? false;
    final route = isLogged
        ? InstagramRoutes.instagramDashboard
        : InstagramRoutes.instagramLogin;

    Future.delayed(
      const Duration(seconds: 1),
      () => Get.offNamed(route),
    );
  }
}
