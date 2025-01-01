import 'package:get/get.dart';
import 'package:getx_demo/pages/onboarding/onboarding_binding.dart';
import 'package:getx_demo/pages/onboarding/onboarding_view.dart';
import 'package:getx_demo/pages/plan/plan_binding.dart';
import 'package:getx_demo/pages/plan/plan_view.dart';
import 'package:getx_demo/pages/start_page/start_page_binding.dart';
import 'package:getx_demo/pages/start_page/start_page_view.dart';
import 'package:getx_demo/routing/app_routes.dart';

class RoutesManager {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.start,
      page: () => const StartPageView(),
      binding: StartPageBinding(),
    ),
    GetPage(
      name: AppRoutes.plan,
      page: () => PlanView(),
      binding: PlanBinding(),
    ),
  ];
}
