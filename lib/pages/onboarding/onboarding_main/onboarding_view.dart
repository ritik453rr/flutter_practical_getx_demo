import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/global.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/common/custom_button.dart';
import 'package:getx_demo/pages/onboarding/onboarding_main/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});
  final controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(horizontal: Global.horizontalPadding),
        width: Get.width,
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Stack(
              children: [
                AnimatedStackCircularProgressBar(
                  size: 270,
                  progressStrokeWidth: 10,
                  backStrokeWidth: 10,
                  startAngle: 0,
                  backColor: const Color(0xffD7DEE7),
                  bars: [
                    AnimatedBarValue(
                      barColor: Colors.green,
                      barValues: 75,
                      fullProgressColors: Colors.red,
                    ),
                    AnimatedBarValue(
                      barColor: Colors.red,
                      barValues: 60,
                      fullProgressColors: Colors.red,
                    ),
                    AnimatedBarValue(
                      barColor: Colors.yellow,
                      barValues: 50,
                      fullProgressColors: Colors.red,
                    ),
                  ],
                ),
                Obx(
                  () => controller.showContainer1.value
                      ? Container(
                          height: 60,
                          width: 90,
                          decoration:
                              CommonUi.roundBoxDecoration(color: Colors.yellow))
                      : const SizedBox(),
                ),
                Obx(
                  () => controller.showContainer2.value
                      ? Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                              height: 60,
                              width: 90,
                              decoration: CommonUi.roundBoxDecoration(
                                  color: Colors.yellow)))
                      : const SizedBox(),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(onPressed: () {}, width: Get.width, title: "Next"),
            const SizedBox(height: Global.bottomSpace),
          ],
        ),
      )),
    );
  }
}
