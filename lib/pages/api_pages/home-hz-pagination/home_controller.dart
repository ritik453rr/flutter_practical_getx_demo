import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:getx_demo/Dialog/app_adaptive_dialog.dart';
import 'package:getx_demo/app_constants.dart';
import 'package:getx_demo/network/model/response_model.dart';
import 'package:getx_demo/network/api_service.dart';
import 'package:getx_demo/pages/api_pages/home-hz-pagination/model/user_model.dart';
import 'package:permission_handler/permission_handler.dart';

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

  var obs1 = 0.obs;
  var obs2 = 0.obs;

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
    );

    if (resModel.status) {
      hasMore = page < 5;
      if (init) {
        users.value = userModelFromJson(jsonEncode(resModel.data));
      } else {
        users.addAll(userModelFromJson(jsonEncode(resModel.data)));
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
