import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_storage.dart';
import 'package:getx_demo/routing/app_routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'home_controller.dart';

/// HomeView is the main view of the home page
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("home"),
        actions: [
          IconButton(
              onPressed: () {
                AppStorage.setLogin(false);
                Get.offAllNamed(AppRoutes.login);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Obx(
          () {
            return SmartRefresher(
                enablePullUp: true,
                controller: controller.refreshController,
                header: const MaterialClassicHeader(
                  color: Colors.green,
                ),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    if (mode == LoadStatus.loading) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                onRefresh: () {
                  controller.onRefresh();
                },
                onLoading: () {
                  controller.onLoading();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: controller.users.length +
                              (controller.loadMore.value ? 1 : 0),
                          controller: controller.scrollController,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            if (index >= controller.users.length) {
                              return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10),
                                child: const CircularProgressIndicator(),
                              );
                            }
                            return Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Text("$index"),
                            );
                          },
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 30),
                        itemCount: controller.userLoading.value
                            ? 10
                            : controller.users.length,
                        itemBuilder: (context, index) {
                          return controller.userLoading.value
                              ? Shimmer.fromColors(
                                  baseColor: AppColors.shimmerBaseColor,
                                  highlightColor:
                                      AppColors.shimmerHighlightColor,
                                  child: const SizedBox(
                                    height: 200,
                                    child: Card(
                                      color: Colors.white,
                                      child: ListTile(
                                        title: Text(""),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 200,
                                  child: Card(
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text(
                                          "${controller.users[index].name}  ${index + 1}"),
                                      subtitle:
                                          Text(controller.users[index].email),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
