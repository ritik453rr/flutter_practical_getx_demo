import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_images.dart';
import 'package:getx_demo/screens/date_time/date_time_widgets.dart';
import 'package:getx_demo/screens/expension_tile/expension_tile_controller.dart';
import 'package:getx_demo/screens/expension_tile/expension_tile_widgets.dart';

class ExpensionTileView extends GetView<ExpensionTileController> {
  const ExpensionTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => expenstionItem(
                    controller: controller.dateController,
                    icon: ImgRes.svgDate,
                    title: "Date",
                    switchValue: controller.dateSwitch.value,
                    onChangedSwitch: (val) {
                      controller.handleDateExpension();
                    },
                    onExpansionChanged: (val) {
                      controller.toggleDateSwitch(val);
                    },
                    children: [
                      DateTimeWidgets.calendarDatePicker2(),
                    ],
                  ),
                ),
                Obx(
                  () => expenstionItem(
                    controller: controller.timeController,
                    icon: "time",
                    title: "Time",
                    switchValue: controller.timeSwitch.value,
                    onChangedSwitch: (val) {
                      controller.handleTimeExpension();
                    },
                    onExpansionChanged: (val) {
                      controller.toggleTimeSwitch(val);
                    },
                    children: [
                      DateTimeWidgets.cupertinoTimePicker(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
