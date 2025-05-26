import 'dart:io';
import 'package:colorful_safe_area/colorful_safe_area.dart';
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
      body: Obx(() => SafeArea(
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
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.pickImage();
                    },
                    child: const Text("Pick Image"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
