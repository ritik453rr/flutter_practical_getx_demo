import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/pages/splash/splash_controller.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Scaffold(
      body:Center(
          child: TextAnimator("Splash",
            style: CommonUi.customTextStyle(
              fontSize: AppFontSizes.font50,
              color: AppColors.black,
              fontFamily: AppFonts.semiBold,
            ),
            characterDelay: const Duration(milliseconds: 300),
            incomingEffect: WidgetTransitionEffects(scale: 1.5, duration: const Duration(milliseconds: 800)),
          )
      ),
    );
  }
}
