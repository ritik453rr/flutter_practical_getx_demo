import 'package:get/get.dart';
import 'package:getx_demo/pages/plan/plan_controller.dart';

class PlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanController>(() => PlanController());
  }
}