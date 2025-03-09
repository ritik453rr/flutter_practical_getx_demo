import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_endpoint.dart';
import 'package:getx_demo/api_service/api_service.dart';
import 'package:getx_demo/api_service/response_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TodosController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  var isLoading = true.obs;
  var todosList = [].obs;

  @override
  void onInit() {
    getTodosList();
    super.onInit();
  }

  void onRefresh() {
    Future.delayed(Duration(seconds: 2), () async {
      await getTodosList();
      refreshController.refreshCompleted();
    });
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    refreshController.loadComplete();
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
