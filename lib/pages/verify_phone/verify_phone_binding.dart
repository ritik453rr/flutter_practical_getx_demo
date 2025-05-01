import 'package:get/get.dart';
import 'package:getx_demo/pages/verify_phone/verify_phone_controller.dart';

class VerifyPhonBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyPhoneController());
  }
  
}