import 'package:get/get.dart';
import 'package:getx_demo/pages/api_pages/home/home_binding.dart';
import 'package:getx_demo/pages/api_pages/home/home_view.dart';
import 'package:getx_demo/pages/api_pages/login/login_binding.dart';
import 'package:getx_demo/pages/api_pages/login/login_view.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/label_dashboard_binding.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/label_dashboard_view.dart';
import 'package:getx_demo/pages/expension_tile/expension_tile_binding.dart';
import 'package:getx_demo/pages/expension_tile/expension_tile_view.dart';
import 'package:getx_demo/pages/future_builder/future_builder_binding.dart';
import 'package:getx_demo/pages/future_builder/future_builder_view.dart';
import 'package:getx_demo/pages/label_iq/label_onboarad/label_onboard_binding.dart';
import 'package:getx_demo/pages/label_iq/label_onboarad/label_onboarding_view.dart';
import 'package:getx_demo/pages/number_picker/number_picker_binding.dart';
import 'package:getx_demo/pages/number_picker/number_picker_view.dart';
import 'package:getx_demo/pages/date_time/date_time_binding.dart';
import 'package:getx_demo/pages/date_time/date_time_view.dart';
import 'package:getx_demo/pages/onboarding/onboarding_main/onboarding_binding.dart';
import 'package:getx_demo/pages/onboarding/onboarding_main/onboarding_view.dart';
import 'package:getx_demo/pages/pick_media/pick_media_binding.dart';
import 'package:getx_demo/pages/pick_media/pick_media_view.dart';
import 'package:getx_demo/pages/stream_builder/stream_builder_binding.dart';
import 'package:getx_demo/pages/stream_builder/stream_builder_view.dart';
import 'package:getx_demo/pages/splash/splash_binding.dart';
import 'package:getx_demo/pages/verify_phone/verify_phone_binding.dart';
import 'package:getx_demo/pages/verify_phone/verify_phone_view.dart';
import 'package:getx_demo/routing/app_routes.dart';
import '../pages/splash/splash_view.dart';

// Defines the application's page routes and their corresponding bindings using GetX
class AppPages {
  // List of all pages with their routes, views, and bindings
  static final pages = [
    GetPage(
      name: AppRoutes.numberPicker,
      page: () => const NumberPickerView(),
      binding: NumberPickerBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyPhone,
      page: () => const VerifyPhoneView(),
      binding: VerifyPhonBinding(),
    ),
    GetPage(
      name: AppRoutes.dateTime,
      page: () => const DateTimeView(),
      binding: DateTimeBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.expensionTile,
      page: () => const ExpensionTileView(),
      binding: ExpensionTileBinding(),
    ),
    GetPage(
      name: AppRoutes.pickMedia,
      page: () => const PickMediaView(),
      binding: PickMediaBinding(),
    ),
    GetPage(
      name: AppRoutes.futureBuilder,
      page: () => const FutureBuilderView(),
      binding: FutureBuilderBinding(),
    ),
    GetPage(
      name: AppRoutes.streamBuilder,
      page: () => const StreamBuilderView(),
      binding: StreamBuilderBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.dashboard,
        page: () => LabelDashboardView(),
        bindings: [
          LabelDashboardBinding(),
        ]),
    GetPage(
      name: AppRoutes.labelOnboarding,
      page: () => LabelOnboardingView(),
      binding: LabelOnboardingBinding(),
    ),
  ];
}
