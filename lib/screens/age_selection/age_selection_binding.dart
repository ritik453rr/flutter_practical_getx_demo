import 'package:get/get.dart';
import 'package:getx_demo/screens/age_selection/age_selection_controller.dart';

class AgeSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgeSelectionController>(() => AgeSelectionController());
  }
}
