import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_shimmers.dart';
import 'package:getx_demo/common/custom_app_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home_controller.dart';

/// HomeView is the main view of the home page
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Newspapers',
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return AppShimmers.newsShimmer();
          }
          return SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () async {
              await controller.fetchNews(isInit: true);
              controller.refreshController.refreshCompleted();
            },
            child: controller.newsList.isEmpty
                ? const Center(child: Text('No newspapers found'))
                : ListView.builder(
                    controller: controller.scrollController,
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 30),
                    itemCount: controller.newsList.length +
                        (controller.fetchingMore.value ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= controller.newsList.length) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 10),
                          child: const CircularProgressIndicator(),
                        );
                      }
                      final news = controller.newsList[index];
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text("${news.title}    ${index + 1}"),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
