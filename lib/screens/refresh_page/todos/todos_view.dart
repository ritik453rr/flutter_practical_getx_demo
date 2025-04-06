import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/screens/refresh_page/todos/todos_controller.dart';
import 'package:getx_demo/shimmers/item_shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TodosView extends GetView<TodosController> {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Todos",
          style: CommonUi.customTextStyle(
            color: AppColors.white,
            fontSize: AppFontSizes.font20,
            fontFamily: AppFonts.fontMedium,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
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
                child: controller.todosList.isEmpty
                    ? const Center(child: Text("Empty"))
                    : ListView.builder(
                        padding: const EdgeInsets.all(30),
                        itemCount: controller.todosList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              HapticFeedback.vibrate();
                              print("jjhjhj");
                            },
                            child: Card(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "title: ${controller.todosList[index]["title"] ?? ''}"),
                                    Text(
                                        "completed: ${controller.todosList[index]["completed"] ?? ''}"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
      ),
    );
  }
}
