import 'package:get/get.dart';
import 'package:getx_demo/screens/pick_media/pick_media_controller.dart';

/// A class that binds the PickMediaController to the PickMediaBinding.
class PickMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PickMediaController());
  }
}
