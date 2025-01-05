import 'package:get/get.dart';
import 'package:getx_demo/pages/age_selection/age_selection_binding.dart';
import 'package:getx_demo/pages/age_selection/age_selection_view.dart';
import 'package:getx_demo/pages/verify_phone/verify_phone_binding.dart';
import 'package:getx_demo/pages/verify_phone/verify_phone_view.dart';
import 'package:getx_demo/routing/app_routes.dart';

class RoutesManager {
  static final pages = [
    GetPage(
      name: AppRoutes.routeAgeSelection,
      page: () => const AgeSelectionView(),
      binding: AgeSelectionBinding(),
    ),
    GetPage(
      name: AppRoutes.routeVerifyPhone,
      page: () => const VerifyPhoneView(),
      binding: VerifyPhonBinding(),
    ),
  ];
}
