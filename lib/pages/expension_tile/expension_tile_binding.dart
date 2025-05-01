import 'package:get/get.dart';
import 'package:getx_demo/pages/expension_tile/expension_tile_controller.dart';

class ExpensionTileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpensionTileController>(() => ExpensionTileController());
  }
}
