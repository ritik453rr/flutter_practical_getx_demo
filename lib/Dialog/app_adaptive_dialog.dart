import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
/// A method to show an adaptive dialog with a title and content.
Future appAdaptiveDialog(
    {String? title,
    required String content,
    String firstBtnText = "ok",
    String secondBtnText = "",
    void Function()? onTapSecondBtn
    }) {
  return showAdaptiveDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(
          title ?? "Error",
          style: CommonUi.customTextStyle(fontSize: 24, color: AppColors.black),
        ),
        content: Text(
          content,
          style: CommonUi.customTextStyle(
            fontSize: AppFontSizes.font14,
            color: AppColors.black,
            fontFamily: AppFonts.fontMedium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              firstBtnText,
              style: CommonUi.customTextStyle(
                color: AppColors.colorTealGreen,
                fontFamily: AppFonts.bold,
              ),
            ),
          ),
          if (secondBtnText.isNotEmpty) ...{
            TextButton(
              onPressed: () {
                onTapSecondBtn?.call();
                
              },
              child: Text(
                secondBtnText,
                style: CommonUi.customTextStyle(
                  color: AppColors.colorTealGreen,
                  fontFamily: AppFonts.bold,
                ),
              ),
            ),
          }
        ],
      );
    },
  );
}
