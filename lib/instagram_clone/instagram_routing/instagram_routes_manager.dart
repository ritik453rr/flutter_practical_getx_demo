import 'package:demo/instagram_clone/home/instagram_home_binding.dart';
import 'package:demo/instagram_clone/home/instagram_home_view.dart';
import 'package:demo/instagram_clone/instagram_dashboard/instagram_dashboarad_view.dart';
import 'package:demo/instagram_clone/instagram_dashboard/instagram_dashboard_binding.dart';
import 'package:demo/instagram_clone/login/instagram_login_binding.dart';
import 'package:demo/instagram_clone/login/instagram_login_view.dart';
import 'package:demo/instagram_clone/instagram_routing/instagram_routes.dart';
import 'package:demo/instagram_clone/instagram_splash/instagram_splash_binding.dart';
import 'package:demo/instagram_clone/instagram_splash/instagram_splash_view.dart';
import 'package:get/get.dart';

class InstagramRoutesManager {
  static final pages = [
    GetPage(
      name: InstagramRoutes.instagramHome,
      page: () => InstagramHomeView(),
      binding: InstagramHomeBinding(),
    ),
    GetPage(
      name: InstagramRoutes.instagramLogin,
      page: () => InstagramLoginView(),
      binding: InstagramLoginBinding(),
    ),
    GetPage(
      name: InstagramRoutes.instagramSplash,
      page: () => InstagramSplashView(),
      binding: InstagramSplashBinding(),
    ),
    GetPage(
      name: InstagramRoutes.instagramDashboard,
      page: () => InstagramDashBoardView(),
      bindings:[
        InstagramDashboardBinding(),
        InstagramHomeBinding(),
      ] 
    )
  ];
}
