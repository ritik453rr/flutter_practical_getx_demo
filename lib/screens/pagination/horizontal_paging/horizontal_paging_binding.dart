import 'package:get/get.dart';
import 'package:getx_demo/screens/pagination/horizontal_paging/horizontal_paging_controller.dart';

class HorizontalPagingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HorizontalPagingController>(() => HorizontalPagingController());
  }
}