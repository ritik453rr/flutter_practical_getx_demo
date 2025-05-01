import 'package:get/get.dart';
import 'package:getx_demo/pages/number_picker/number_picker_controller.dart';

class NumberPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NumberPickerController>(() => NumberPickerController());
  }
}
