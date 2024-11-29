import 'package:demo/insta_demo/home/home_binding.dart';
import 'package:demo/insta_demo/home/home_view.dart';
import 'package:demo/insta_demo/login/login_binding.dart';
import 'package:demo/insta_demo/login/login_view.dart';
import 'package:demo/routing/app_routes.dart';
import 'package:demo/share_demo/share_demo_binding.dart';
import 'package:demo/share_demo/share_demo_view.dart';
import 'package:get/get.dart';

class RoutesManager {
  static final pages = [
    GetPage(
      name: AppRoutes.shareDemo,
      page: () => const ShareDemoView(),
      binding: ShareDemoBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
