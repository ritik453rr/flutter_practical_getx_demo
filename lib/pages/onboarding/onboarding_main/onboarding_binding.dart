import 'package:get/get.dart';
import 'package:getx_demo/pages/onboarding/onboarding_main/onboarding_controller.dart';

/// Binding class for the Onboarding feature
class OnboardingBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(()=> OnboardingController());
  }
}