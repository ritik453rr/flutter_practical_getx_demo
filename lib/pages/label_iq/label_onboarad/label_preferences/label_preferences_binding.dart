import 'package:get/get.dart';
import 'package:getx_demo/pages/label_iq/label_onboarad/label_preferences/label_preferences_controller.dart';

class LabelPreferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LabelPreferencesController());
  }
}
