import 'package:get/get.dart';
import 'package:getx_demo/onboarding/onboarding_binding.dart';
import 'package:getx_demo/onboarding/onboarding_view.dart';
import 'package:getx_demo/routing/app_routes.dart';

class RoutesManager {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
