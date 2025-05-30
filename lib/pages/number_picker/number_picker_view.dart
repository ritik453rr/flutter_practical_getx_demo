import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/pages/number_picker/number_picker_controller.dart';
import 'package:wheel_slider/wheel_slider.dart';

class NumberPickerView extends StatefulWidget {
  const NumberPickerView({super.key});

  @override
  State<NumberPickerView> createState() => _NumberPickerViewState();
}

final NumberPickerController onboardingController = Get.find();

class _NumberPickerViewState extends State<NumberPickerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: Column(
        children: [
          // Space....
          Container(
            height: 80,
            width: Get.width,
            color: AppColors.deepPurple,
          ),
          // Wave Image....
          Stack(
            children: [
              Container(
                height: 60,
                width: Get.width,
                color: AppColors.deepPurple,
              ),
              CommonUi.setPngImg("wave"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Obx(
              () => WheelSlider.number(
                pointerColor: Colors.red,
                showPointer: true,
                isInfinite: false,
                totalCount: 10,
                initValue: onboardingController.selectedAge.value,
                currentIndex: onboardingController.selectedIndex.value,
                squeeze: 0.5,
                hapticFeedbackType: HapticFeedbackType.heavyImpact,
                selectedNumberStyle: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
                unSelectedNumberStyle: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
                onValueChanged: (val) {
                  onboardingController.selectedAge.value = val;
                  onboardingController.selectedIndex.value = val;
                },
                customPointer: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
