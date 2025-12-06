import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/global.dart';
import 'package:getx_demo/routing/app_routes.dart';

class SlidePanelView extends StatelessWidget {
  SlidePanelView({super.key});
  final tabIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.lifeCycle);
              },
              icon: Icon(Icons.route)),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: Get.width,
              color: Colors.yellow,
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.72,
              minChildSize: 0.7,
              maxChildSize: 0.82,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.hzPadding),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      const SliverToBoxAdapter(child: SizedBox(height: 20)),
                      SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            "Product Name",
                            textAlign: TextAlign.center,
                            style: CommonUi.customTextStyle(
                              fontSize: AppFontSizes.font28,
                              fontFamily: AppFonts.semiBold,
                            ),
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 24)),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 100,
                          width: Get.width,
                          color: Colors.green,
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 24)),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 100,
                          width: Get.width,
                          color: Colors.red,
                        ),
                      ),
                      // const SliverToBoxAdapter(child: SizedBox(height: 24)),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 100,
                          width: Get.width,
                          color: Colors.pink,
                        ),
                      ),

                      SliverAppBar(
                        pinned: true,
                        automaticallyImplyLeading: false,
                        surfaceTintColor: Colors.white,
                        toolbarHeight: 45,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        flexibleSpace: Obx(
                          () => Center(
                            child: SizedBox(
                              width: Get.width,
                              height: 45,
                              child: CupertinoSlidingSegmentedControl(
                                thumbColor: Colors.green,
                                padding: const EdgeInsets.all(2),
                                groupValue: tabIndex.value,
                                children: const {
                                  0: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("data")),
                                  1: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("data")),
                                },
                                onValueChanged: (i) {
                                  tabIndex.value = i ?? 0;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Obx(() {
                          return tabIndex.value == 0
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: Get.width,
                                      color: Colors.orange,
                                      height: 50,
                                      margin: EdgeInsets.only(bottom: 10),
                                    );
                                  },
                                  separatorBuilder: (context, i) {
                                    return Divider(
                                      height: 0,
                                    );
                                  },
                                  itemCount: 100)
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: Get.width,
                                      color: Colors.green,
                                      height: 50,
                                      margin: const EdgeInsets.only(bottom: 10),
                                    );
                                  },
                                  separatorBuilder: (context, i) {
                                    return const Divider(
                                      height: 0,
                                    );
                                  },
                                  itemCount: 100);
                        }),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppConstants.bottomSpace),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
