import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/common/app_constants.dart';
import 'package:getx_demo/pages/pick_media/pick_media_controller.dart';

class PickMediaView extends GetView<PickMediaController> {
  const PickMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: Text(
          "Pick Media",
          style: CommonUi.customTextStyle(
            color: AppColors.white,
            fontSize: AppFontSizes.font20,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.imagePaths.value.isNotEmpty
                  ? Image.file(
                      File(controller.imagePaths.value),
                      height: Get.height * 0.7,
                      width: Get.width,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  controller.pickImage();
                },
                child: const Text("Pick Image"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
