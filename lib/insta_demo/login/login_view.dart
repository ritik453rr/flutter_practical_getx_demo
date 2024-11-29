import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:demo/common/app_colors.dart';
import 'package:demo/common/common_ui.dart';
import 'package:demo/common/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.customWhite,
      child: Scaffold(
        appBar: CustomAppBar(
          title: CommonUi.setSvgImage("back_arrow_ios_icon"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            //color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 86,
                ),
                Center(
                  child: CommonUi.setPngImage("instagram_text",
                      height: 50, width: 182),
                ),
                const SizedBox(
                  height: 34,
                ),
                TextFormField(
                  cursorColor: AppColors.deepBlack,
                  decoration: InputDecoration(
                    hintText: "Email, username, phone",
                    hoverColor: AppColors.lightGray,
                    fillColor: AppColors.lightGray,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: AppColors.softGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: AppColors.softGray),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
