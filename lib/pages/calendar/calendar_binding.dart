import 'package:get/get.dart';
import 'package:getx_demo/pages/calendar/calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}