import 'package:get/get.dart';
import 'package:getx_demo/pages/web_view/app_web_controller.dart';

/// Binding class for the App Web feature
class AppWebBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AppWebController());
  }
}