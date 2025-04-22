import 'package:get/get.dart';
import 'package:getx_demo/screens/number_picker/number_picker_controller.dart';

class AgeSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NumberPickerController>(() => NumberPickerController());
  }
}
