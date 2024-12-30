import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/images.dart';
import 'package:wheel_slider/wheel_slider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
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
              Image.asset(
                ImgRes.wave,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: WheelSlider.number(
              // perspective: 0.03,
              pointerColor: Colors.red,
              showPointer: true,
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
              totalCount: 10,
              initValue: 4,
              isInfinite: false,
              squeeze: 0.5,
              unSelectedNumberStyle: const TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
              currentIndex: 3,
              onValueChanged: (val) {
                
              },
              hapticFeedbackType: HapticFeedbackType.heavyImpact,
            ),
          ),
        ],
      ),
    );
  }
}
