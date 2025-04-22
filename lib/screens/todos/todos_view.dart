import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_constants.dart';
import 'package:getx_demo/common/app_shimmers.dart';
import 'package:getx_demo/common/custom_app_bar.dart';
import 'package:getx_demo/language/app_strings.dart';
import 'package:getx_demo/screens/todos/todos_controller.dart';

// View class that displays the list of todos with loading and empty states
class TodosView extends GetView<TodosController> {
  const TodosView({super.key});

  // Builds the UI for the todos list screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.language.tr),
      body: Obx(() {
        if (controller.isLoading.value) {
          return AppShimmers.todoItemShimmer();
        }

        if (controller.errorMessage.isNotEmpty) {
          return _buildErrorView();
        }

        if (controller.todosList.isEmpty) {
          return _buildEmptyView();
        }

        return _buildTodosList();
      }),
    );
  }

  // Builds the error view with retry button
  Widget _buildErrorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.errorMessage.value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: controller.refreshTodos,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  // Builds the empty state view
  Widget _buildEmptyView() {
    return const Center(
      child: Text(
        "No todos found",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  // Builds the list of todos with pull-to-refresh
  Widget _buildTodosList() {
    return RefreshIndicator(
      onRefresh: controller.refreshTodos,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.todosList.length,
        itemBuilder: (context, index) {
          final todo = controller.todosList[index];
          return _buildTodoItem(todo);
        },
      ),
    );
  }

  // Builds individual todo item card
  Widget _buildTodoItem(Todo todo) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: () {
          AppConstants.hapticFeedBack();
        },
        title: Text(
          todo.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'Task ${todo.id}',
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        trailing: Icon(
          todo.completed ? Icons.check_circle : Icons.circle_outlined,
          color: todo.completed ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
