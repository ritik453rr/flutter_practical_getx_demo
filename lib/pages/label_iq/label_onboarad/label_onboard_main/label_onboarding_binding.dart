import 'package:get/get.dart';
import 'package:getx_demo/pages/label_iq/label_onboarad/label_onboard_main/label_onboarding_controller.dart';

/// Binding class for the Onboarding feature
class LabelOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LabelOnboardingController());
  }
}
