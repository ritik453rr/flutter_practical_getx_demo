import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/app_storage.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/common/custom_button.dart';
import 'package:getx_demo/routing/app_routes.dart';

class LabelWelcomeView extends StatelessWidget {
  const LabelWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to LabelIQ",
              style: CommonUi.customTextStyle(
                  fontSize: 24, fontFamily: AppFonts.fontMedium),
            ),
            SizedBox(height: 20),
            CustomButton(
                onPressed: () {
                  AppStorage.setPrefsStatus(true);
                  Get.offNamed(AppRoutes.labelOnboarding);
                },
                title: "Get Started")
          ],
        ),
      ),
    );
  }
}
