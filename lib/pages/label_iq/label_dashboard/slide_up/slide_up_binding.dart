import 'package:get/get.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/slide_up/slide_up_controller.dart';

/// Binding class for SlideUp feature
class SlideUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SlideUpController>(() => SlideUpController());
  }
}