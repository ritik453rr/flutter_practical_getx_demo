import 'package:get/get.dart';
import 'package:getx_demo/pages/api_pages/home-hz-pagination/home_binding.dart';
import 'package:getx_demo/pages/api_pages/home-hz-pagination/home_view.dart';
import 'package:getx_demo/pages/api_pages/login/login_binding.dart';
import 'package:getx_demo/pages/api_pages/login/login_view.dart';
import 'package:getx_demo/pages/stream_builder/stream_builder_binding.dart';
import 'package:getx_demo/pages/stream_builder/stream_builder_view.dart';
import 'package:getx_demo/pages/web_view/app_web_binding.dart';
import 'package:getx_demo/pages/web_view/app_web_view.dart';
import 'package:getx_demo/routing/app_routes.dart';

// Defines the application's page routes and their corresponding bindings using GetX
class AppPages {
  // List of all pages with their routes, views, and bindings
  static final pages = [
  

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
      name: AppRoutes.appWeb,
      page: () => AppWebView(),
      binding: AppWebBinding(),
    ),
  ];

}
