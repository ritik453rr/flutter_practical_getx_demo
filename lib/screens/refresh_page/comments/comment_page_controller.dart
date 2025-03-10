import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_endpoint.dart';
import 'package:getx_demo/api_service/api_service.dart';
import 'package:getx_demo/api_service/response_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommentPageController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  var isLoading = true.obs;
  var commentList = [].obs;

  @override
  void onInit() {
    getCommentList();
    super.onInit();
  }

  /// method to fech comment list.
  Future<void> getCommentList() async {
    ResponseModel resModel = await ApiService().getRequest(
      endPoint: ApiEndPoint.comments,
    );
    isLoading.value = false;
    if (resModel.status) {
      commentList.clear();
      commentList.assignAll(json.decode(resModel.data.bodyString));
    }
  }

  void onRefresh() async {
    await getCommentList();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }
}
