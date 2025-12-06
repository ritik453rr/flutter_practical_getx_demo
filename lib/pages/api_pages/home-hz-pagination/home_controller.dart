import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/global.dart';
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
  var fileDownloadProgress = 0.0.obs;
  String? downloadDir;

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

  /// Checks storage permission and initiates file download
  void getDownloadDir(
      {String url =
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"}) async {
    if (downloadDir == null) {
      downloadDir = await FilePicker.platform.getDirectoryPath(
        dialogTitle: "Select Download Folder",
      );
      if (downloadDir != null) {
        downloadFile(url: url, path: downloadDir!);
      }
    } else {
      downloadFile(url: url, path: downloadDir!);
    }
  }

  /// Downloads a file from the given URL
  Future<void> downloadFile({required String url, required String path}) async {
    final ResponseModel resModel = await ApiService().downloadMedia(
      url: url,
      dirPath: path,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          fileDownloadProgress.value = (received / total) * 100;
        }
      },
    );

    if (resModel.status) {
      print(resModel.message);
    } else {
      print("False");
    }
  }

}
