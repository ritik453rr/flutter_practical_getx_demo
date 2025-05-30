import 'package:get/get.dart';
import 'package:getx_demo/pages/date_time/date_time_controller.dart';

class DateTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateTimeController>(() => DateTimeController());
  }
}
