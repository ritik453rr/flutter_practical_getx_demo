import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_endpoint.dart';
import 'package:getx_demo/api_service/api_service.dart';
import 'package:getx_demo/api_service/response_model.dart';

// Controller class that manages the todos list state and API interactions
class TodosController extends GetxController {
  // Observable states
  final RxBool isLoading = true.obs;
  final RxList<Todo> todosList = <Todo>[].obs;
  final RxString errorMessage = ''.obs;

  // API service instance
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    getTodosList();
  }

  // Fetches the todos list from the API and updates the state
  Future<void> getTodosList() async {
    try {
      errorMessage.value = '';

      final ResponseModel resModel = await _apiService.getRequest(
        endPoint: ApiEndPoint.todos,
      );

      if (resModel.status) {
        final List<dynamic> data = json.decode(resModel.data.bodyString);
        todosList.value = data.map((json) => Todo.fromJson(json)).toList();
      } else {
        errorMessage.value = resModel.message;
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
        );
      }
    } catch (e) {
      errorMessage.value = 'An unexpected error occurred';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Refreshes the todos list
  Future<void> refreshTodos() async {
    await getTodosList();
  }
}

// Model class for Todo items
class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}
