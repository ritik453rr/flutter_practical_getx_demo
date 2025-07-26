import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/pages/label_iq/dashboard/dashboard_controller.dart';
import 'package:getx_demo/pages/label_iq/dashboard/widgets_dashboard.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Colors.yellow.withOpacity(0.7),
      bottomNavigationBar: Obx(
        () {
          controller.selectedIndex.value;
          return MoltenBottomNavigationBar(
            selectedIndex: 1,
            domeCircleColor: Colors.black,
            onTabChange: (clickedIndex) {
              controller.tabChange(clickedIndex);
            },
            tabs: [
              MoltenTab(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.apple,
                      color: controller.selectedIndex.value == 0
                          ? Colors.green
                          : null,
                    ),
                    Text("Hello")
                  ],
                ),
              ),
              MoltenTab(
                icon: Icon(Icons.scanner_outlined),
              ),
              MoltenTab(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: controller.selectedIndex.value == 1
                          ? Colors.green
                          : null,
                    ),
                    Text("Profile")
                  ],
                ),
              ),
            ],
          );
        },
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(right: 5),
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                  offset: const Offset(5, 42),
                  iconSize: 30,
                  menuPadding: const EdgeInsets.symmetric(vertical: 12),
                  constraints: const BoxConstraints(
                    minWidth: 170,
                  ),
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        enabled: false,
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            menuItem(title: "Save", icon: Icons.save),
                            menuItem(title: "Save", icon: Icons.save),
                            menuItem(
                                title: "Save", icon: Icons.save, isLast: true),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              
              
              ],
            ),
          ),
        ],
      )),

      //   Obx(()=>
      //   dashScreens[controller.selectedIndex.value],
      // )
    ));
  }
}

enum SampleItem { itemOne, itemTwo, itemThree }
