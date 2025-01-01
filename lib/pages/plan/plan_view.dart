import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/common/custom_button.dart';
import 'package:getx_demo/pages/plan/plan_controller.dart';
import 'package:getx_demo/pages/plan/plan_widgets.dart';

class PlanView extends StatelessWidget {
  PlanView({super.key});
  final PlanController planController = Get.find();

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
                          horizontal: 32,
                          vertical: 26,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Jurni Access",
                              style: CommonUI.customTextStyle(
                                fontSize: 20,
                                color: AppColors.black,
                                fontFamily: AppFonts.semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Ready to level up? Start using AI to\nachieve your goals faster!",
                              textAlign: TextAlign.center,
                              style: CommonUI.customTextStyle(
                                fontSize: 12,
                                color: AppColors.black,
                                fontFamily: AppFonts.medium,
                              ),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  buildPricingCard(
                                    title: "Monthly",
                                    price: "\$14.99",
                                    frequency: "/mo",
                                    borderColor:
                                        planController.selectedPlan.value ==
                                                "monthly"
                                            ? AppColors.colorPrimary
                                            : null,
                                    offer: planController.selectedPlan.value ==
                                            "monthly"
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: AppColors.colorPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              "Save 60%",
                                              style: CommonUI.customTextStyle(
                                                fontFamily: AppFonts.semiBold,
                                                fontSize: 10,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          )
                                        : null,
                                    onTap: () {
                                      planController.selectedPlan.value =
                                          "monthly";
                                    },
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  buildPricingCard(
                                    title: "Yearly",
                                    price: "\$14.99",
                                    frequency: "/mo",
                                    borderColor:
                                        planController.selectedPlan.value ==
                                                "yearly"
                                            ? AppColors.colorPrimary
                                            : null,
                                    offer: planController.selectedPlan.value ==
                                            "yearly"
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: AppColors.colorPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              "Save 60%",
                                              style: CommonUI.customTextStyle(
                                                fontFamily: AppFonts.semiBold,
                                                fontSize: 10,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          )
                                        : null,
                                    onTap: () {
                                      planController.selectedPlan.value =
                                          "yearly";
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Obx(
                          () => CustomButton(
                            width: Get.width,
                            backgroundColor: planController.selectedPlan.isEmpty
                                ? AppColors.colorPeachBlush
                                : AppColors.colorSecondary,
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
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Already purchased?",
                        style: CommonUI.customTextStyle(
                          fontSize: 10,
                          color: AppColors.colorNeutralGray,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
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
