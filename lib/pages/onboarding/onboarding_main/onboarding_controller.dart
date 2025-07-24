import 'package:get/state_manager.dart';

class OnboardingController extends GetxController {
  var showContainer1 = false.obs;
  var showContainer2 = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 3080), () {
      showContainer1.value = true;
    });
     Future.delayed(const Duration(milliseconds: 3600), () {
      showContainer2.value = true;
    });
  }
}
