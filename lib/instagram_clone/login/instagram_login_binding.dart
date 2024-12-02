import 'package:get/get.dart';

class InstagramLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstagramLoginBinding);
  }
}
