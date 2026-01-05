import 'package:get/get.dart';
import 'package:getx_demo/features/life_cycle/life_cycle_controller.dart';


/// Binds the controller lazily when its needed.
class LifeCycleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LifeCycleController());
  }
}
