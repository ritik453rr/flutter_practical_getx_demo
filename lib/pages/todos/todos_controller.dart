import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_endpoint.dart';
import 'package:getx_demo/api_service/api_service.dart';
import 'package:getx_demo/api_service/response_model.dart';

class TodosController extends GetxController {
  var isLoading = true.obs;
  var todosList = [].obs;

  @override
  void onInit() {
    getTodosList();
    super.onInit();
  }

  Future<void> getTodosList() async {
    ResponseModel resModel = await ApiService().getRequest(
      endPoint: ApiEndPoint.todos,
    );
    isLoading.value = false;
    if (resModel.status) {
      todosList.clear();
      todosList.assignAll(json.decode(resModel.data.bodyString));
    } else {
      print("Error: ${resModel.message}");
    }
  }
}
