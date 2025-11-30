import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_models/response_model.dart';
import 'package:getx_demo/api_service/api_models/user_model.dart';
import 'package:getx_demo/api_service/api_service.dart';

/// HomeController manages the state and business logic for the home page
class HomeController extends GetxController {
  /// Controllers and Instances
  var hzScrollCtr = ScrollController();
  var vtScrollCtr = ScrollController();

  // Variables
  var page = 1;
  final RxBool userLoading = true.obs;
  var loadMore = false.obs;
  var hasMore = false;

  /// Lists
  var users = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    addScrollListener();
    getUsers(init: true);
  }

  /// Add scroll listener to the scroll controller
  void addScrollListener() {
    hzScrollCtr.addListener(() {
      if (hzScrollCtr.position.pixels >=
              hzScrollCtr.position.maxScrollExtent - 150 &&
          hasMore &&
          !loadMore.value) {
        fetchMoreUsers();
      }
    });
    vtScrollCtr.addListener(() {
      if (vtScrollCtr.position.pixels >=
              vtScrollCtr.position.maxScrollExtent - 150 &&
          hasMore &&
          !loadMore.value) {
        fetchMoreUsers();
      }
    });
  }

  Future<void> getUsers({bool init = false}) async {
    ResponseModel resModel = await ApiService().getRequest(
      url: "https://jsonplaceholder.typicode.com/users",
      model: userModelFromJson,
    );

    if (resModel.status) {
      hasMore = page < 5;
      if (init) {
        users.value = resModel.data;
      } else {
        users.addAll(resModel.data);
      }
      userLoading.value = false;
    } else {
      userLoading.value = false;
    }
  }

  /// Fetch more news from the API
  Future<void> fetchMoreUsers() async {
    loadMore.value = true;
    page++;
    await getUsers();
    loadMore.value = false;
  }

  /// Handle pull-to-refresh action
  Future<void> onRefresh() async {
    users.isEmpty ? userLoading.value = true : false;
    page = 1;
    loadMore.value = false;
    hasMore = false;
    await getUsers(init: true);
  }

  void onLoading() async {
    if (!hasMore) {
      return;
    }
    page++;
    await getUsers();
    if (hasMore) {
      // refreshController.loadComplete();
    } else {
      // refreshController.loadNoData();
    }
  }
}
