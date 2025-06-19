import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/pages/splash/splash_controller.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingScaleUp(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInOut,
          ),
          child: Text(
            "Splash",
            style: CommonUi.customTextStyle(
              fontSize: AppFontSizes.font50,
              color: AppColors.black,
              fontFamily: AppFonts.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}