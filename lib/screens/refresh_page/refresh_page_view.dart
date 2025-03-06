import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/screens/refresh_page/refresh_page_controller.dart';
import 'package:getx_demo/shimmers/item_shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class RefreshPageView extends GetView<RefreshPageController> {
  const RefreshPageView({super.key});

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
                child: ListView.builder(
                  padding: const EdgeInsets.all(30),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.red,
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 50,
                      width: Get.width,
                    );
                  },
                ),
              ),
      ),
    ));
  }
}
