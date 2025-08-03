import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/label_dashboard_main/label_dashboard_controller.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/label_dashboard_main/widgets_label_dashboard.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class LabelDashboardView extends StatelessWidget {
  LabelDashboardView({super.key});
  final controller = Get.find<LabelDashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.red,
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
            body: Obx(
              () => dashScreens[controller.selectedIndex.value],
            )));
  }
}
