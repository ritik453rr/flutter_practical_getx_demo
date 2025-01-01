import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';

/// A function that returns a widget for displaying a pricing card.
Widget buildPricingCard({
  required String title,
  required String price,
  required String frequency,
  Color? borderColor,
  void Function()? onTap,
  Widget? offer,
}) {
  return Expanded(
    child: Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: borderColor ?? AppColors.colorLightGray,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: CommonUI.customTextStyle(
                        fontSize: 12,
                        color: AppColors.black,
                        fontFamily: AppFonts.medium,
                      ),
                    ),
                    const SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        text: price,
                        style: CommonUI.customTextStyle(
                          fontSize: 16,
                          color: AppColors.black,
                          fontFamily: AppFonts.semiBold,
                        ),
                        children: [
                          TextSpan(
                            text: frequency,
                            style: CommonUI.customTextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontFamily: AppFonts.medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: offer,
        ),
      ],
    ),
  );
}
