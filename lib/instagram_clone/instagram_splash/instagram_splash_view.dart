import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:demo/instagram_clone/common/app_colors.dart';
import 'package:demo/instagram_clone/common/common_ui.dart';
import 'package:demo/instagram_clone/instagram_splash/instagram_splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstagramSplashView extends StatelessWidget {
  InstagramSplashView({super.key});

  /// Controller for managing splash screen logic such as navigation.
  final InstagramSplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.customWhite,
      topColor: AppColors.customWhite,
      bottomColor: AppColors.customWhite,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.customWhite,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Displays the Instagram logo.
              CommonUi.setPngImage("instagram_logo", height: 55, width: 55),
              const SizedBox(height: 15),

              // Displays the Instagram text logo.
              CommonUi.setPngImage("instagram_text", height: 40, width: 400),
            ],
          ),
        ),
      ),
    );
  }
}
