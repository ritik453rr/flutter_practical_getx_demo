import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/common/custom_button.dart';

class StartPageView extends StatelessWidget {
  const StartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottom: false,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Stack(
                children: [
                  CommonUI.setPngImg(
                    "traveller",
                    fit: BoxFit.cover,
                    width: Get.width,
                  ),
                  CommonUI.setPngImg(
                    "traveller",
                    fit: BoxFit.cover,
                    color: AppColors.colorPrimary.withOpacity(0.5),
                    width: Get.width,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 26,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Turn Priorities into Action",
                              style: CommonUI.customTextStyle(
                                fontSize: 18,
                                color: AppColors.colorPrimary,
                                fontFamily: AppFonts.semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "We help keep you accountable by tracking your goals using AI to give you actionable points",
                              textAlign: TextAlign.center,
                              style: CommonUI.customTextStyle(
                                fontSize: 20,
                                color: AppColors.colorDarkGray,
                                fontFamily: AppFonts.semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: CustomButton(
                          width: Get.width,
                          backgroundColor: AppColors.colorSecondary,
                          onPressed: () {},
                          child: Text(
                            "Start my journey",
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: CommonUI.customTextStyle(
                              fontSize: 13,
                              fontFamily: AppFonts.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
