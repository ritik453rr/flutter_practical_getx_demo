import 'package:demo/routing/routes.dart';
import 'package:demo/share_demo/share_demo_binding.dart';
import 'package:demo/share_demo/share_demo_view.dart';
import 'package:get/get.dart';

class RoutesManager {
  static final pages = [
    GetPage(
      name: Routes.shareDemo,
      page: () => const ShareDemoView(),
      binding: ShareDemoBinding(),
    ),
  ];
}
