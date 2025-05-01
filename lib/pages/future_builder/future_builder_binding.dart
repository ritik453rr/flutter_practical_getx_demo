import 'package:get/get.dart';
import 'package:getx_demo/pages/future_builder/future_builder_controller.dart';

class FutureBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FutureBuilderController());
  }
}

