import 'package:get/get.dart';
import 'home_controller.dart';

/// HomeBinding initializes the dependencies for the home page
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
} 