import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/global.dart';
import 'package:getx_demo/common/custom_app_bar.dart';
import 'package:getx_demo/common/custom_button.dart';
import 'package:getx_demo/pages/label_iq/label_onboarad/label_preferences/label_preferences_controller.dart';
import 'package:getx_demo/pages/label_iq/label_onboarad/label_preferences/widgets_label_preferences.dart';

class LabelPreferencesView extends StatelessWidget {
  LabelPreferencesView({super.key});
  final controller = Get.find<LabelPreferencesController>();
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.softGreen,
        appBar: customAppBar(
          title: "Onboarding",
          centerTitle: true,
          backgroundColor: AppColors.softGreen,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: PageView(
                    physics: ClampingScrollPhysics(),
                    onPageChanged: (value) {
                      controller.onPageChanged(value);
                    },
                    controller: controller.pageController,
                    children: onboardPages),
              ),
              CustomButton(
                  onPressed: () {
                    controller.onTapNext();
                  },
                  title: "Next"),
              SizedBox(height: Global.bottomSpace)
            ],
          ),
        ),
      ),
    );
  }
}
