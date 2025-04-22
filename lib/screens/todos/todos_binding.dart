import 'package:get/get.dart';
import 'package:getx_demo/screens/todos/todos_controller.dart';

// Binding class that manages the dependency injection for the Todos feature
class TodosBinding extends Bindings {
  // Registers the TodosController for dependency injection
  @override
  void dependencies() {
    Get.lazyPut<TodosController>(() => TodosController());
  }
}
