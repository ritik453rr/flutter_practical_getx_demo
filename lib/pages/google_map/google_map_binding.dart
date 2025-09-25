import 'package:get/get.dart';
import 'package:getx_demo/pages/google_map/google_map_controller.dart';

class GoogleMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoogleMapViewController());
  }
}
