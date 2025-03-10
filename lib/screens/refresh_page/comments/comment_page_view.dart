import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/screens/refresh_page/comments/comment_page_controller.dart';
import 'package:getx_demo/shimmers/item_shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommentPageView extends GetView<CommentPageController> {
  const CommentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? const ItemShimmer()
              : SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  controller: controller.refreshController,
                  onRefresh: controller.onRefresh,
                  onLoading: controller.onLoading,
                  footer: CommonUi.refreshFooter(),
                  header: CommonUi.refreshMaterialHeader(),
                  child: controller.commentList.isEmpty
                      ? const Center(child: Text("Empty"))
                      : ListView.builder(
                          padding: const EdgeInsets.all(30),
                          itemCount: controller.commentList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "email:${controller.commentList[index]["email"] ?? ''}"),
                                    Text(
                                        "id:${controller.commentList[index]["id"] ?? ''}"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
        ),
      ),
    );
  }
}
