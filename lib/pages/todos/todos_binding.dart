import 'package:get/get.dart';
import 'package:getx_demo/pages/todos/todos_controller.dart';

class TodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodosController>(() => TodosController());
  }
}
