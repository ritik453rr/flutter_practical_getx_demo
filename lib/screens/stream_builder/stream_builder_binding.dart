import 'package:get/get.dart';
import 'package:getx_demo/screens/stream_builder/stream_builder_controller.dart';

class StreamBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StreamBuilderController());
  }
}

