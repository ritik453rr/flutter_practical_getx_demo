import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/features/home/home_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// UserListView is the main view of the user list page
class UserListView extends StatelessWidget {
  UserListView({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return RefreshIndicator(
              onRefresh: () async {
                controller.onRefresh();
              },
              child: !controller.userLoading.value && controller.users.isEmpty
                  ?

                  /// Empty state
                  CommonUi.emptyState()
                  : ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      controller: controller.vtScrollCtr,

                      children: [
                        /// Horizontal Pagination ListView

                        // SizedBox(
                        //   height: 100,
                        //   child: ListView.builder(
                        //     itemCount: controller.users.length +
                        //         (controller.loadMore.value ? 1 : 0),
                        //     controller: controller.hzScrollCtr,
                        //     scrollDirection: Axis.horizontal,
                        //     padding: const EdgeInsets.symmetric(horizontal: 20),
                        //     itemBuilder: (context, index) {
                        //       if (index >= controller.users.length) {
                        //         return Container(
                        //           alignment: Alignment.center,
                        //           margin: const EdgeInsets.only(top: 10),
                        //           child: const CircularProgressIndicator(),
                        //         );
                        //       }
                        //       return Container(
                        //         height: 100,
                        //         width: 100,
                        //         alignment: Alignment.center,
                        //         margin: const EdgeInsets.only(right: 10),
                        //         decoration: const BoxDecoration(
                        //             color: Colors.red, shape: BoxShape.circle),
                        //         child: Text("$index"),
                        //       );
                        //     },
                        //   ),
                        // ),

                        Skeletonizer(
                          enabled: controller.userLoading.value,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                                top: 30, left: 20, right: 20, bottom: 30),
                            itemCount: controller.userLoading.value
                                ? 10
                                : controller.users.length +
                                    (controller.loadMore.value ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index >= controller.users.length &&
                                  !controller.userLoading.value) {
                                return Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: const CircularProgressIndicator(),
                                );
                              }
                              return controller.userLoading.value
                                  ? const SizedBox(
                                      height: 200,
                                      child: Card(
                                        color: Colors.white,
                                        child: ListTile(
                                          title: Text("User Name"),
                                          subtitle: Text("User email here"),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: CommonUi.onTapEffect(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.black12,
                                            width: 0.5,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12
                                                  .withValues(alpha: 0.08),
                                              blurRadius: 12,
                                              spreadRadius: 1,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        onTap: () {},
                                        child: Container(
                                          height: 200,
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${controller.users[index].name}  ${index + 1}",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                  controller.users[index].email)
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
