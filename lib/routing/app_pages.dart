import 'package:get/get.dart';
import 'package:getx_demo/features/contact/app_contact_controller.dart';
import 'package:getx_demo/features/contact/app_contact_view.dart';
import 'package:getx_demo/features/download_file/download_file_controller.dart';
import 'package:getx_demo/features/download_file/download_file_view.dart';
import 'package:getx_demo/features/home/home_controller.dart';
import 'package:getx_demo/features/home/view/home_view.dart';
import 'package:getx_demo/features/google_map/google_map_binding.dart';
import 'package:getx_demo/features/google_map/google_map_view.dart';
import 'package:getx_demo/features/home/view/user_list_view.dart';
import 'package:getx_demo/features/life_cycle/life_cycle_binding.dart';
import 'package:getx_demo/features/life_cycle/life_cycle_view.dart';
import 'package:getx_demo/features/slideup_panel/slide_panel_view.dart';
import 'package:getx_demo/features/splash/splash_binding.dart';
import 'package:getx_demo/features/splash/splash_view.dart';
import 'package:getx_demo/features/stream_builder/stream_builder_binding.dart';
import 'package:getx_demo/features/stream_builder/stream_builder_view.dart';
import 'package:getx_demo/features/web_view/app_web_binding.dart';
import 'package:getx_demo/features/web_view/app_web_view.dart';
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
      page: () =>  HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.appWeb,
      page: () => AppWebView(),
      binding: AppWebBinding(),
    ),
    GetPage(
      name: AppRoutes.slidePanel,
      page: () => SlidePanelView(),
    ),
    GetPage(
      name: AppRoutes.lifeCycle,
      page: () => LifeCycleView(),
      binding: LifeCycleBinding(),
    ),
    GetPage(
      name: AppRoutes.googleMap,
      page: () => GoogleMapView(),
      binding: GoogleMapBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: AppRoutes.downloadFile,
        page: () => DownloadFileView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => DonwloadFileController(),
          );
        })),
    GetPage(
        name: AppRoutes.appContact,
        page: () => AppContactView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => AppContactController(),
          );
        })),
    GetPage(
      name: AppRoutes.userList,
      page: () => UserListView(),
    ),
  ];
}
