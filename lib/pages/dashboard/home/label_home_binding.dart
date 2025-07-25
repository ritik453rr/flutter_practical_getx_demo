import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/pages/dashboard/home/home_controller.dart';

class LabelHomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => LabelController());
  }
}
