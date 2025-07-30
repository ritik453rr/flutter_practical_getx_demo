import 'package:get/get.dart';
import 'package:getx_demo/pages/label_iq/label_onboarad/label_onboard_main/label_controller.dart';

class LabelOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LabelOnboardController());
  }
}
