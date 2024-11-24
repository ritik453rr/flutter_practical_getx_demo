import 'package:demo/common/app_color.dart';
import 'package:demo/common/app_fonts.dart';
import 'package:demo/common/common_ui.dart';
import 'package:demo/common/custom_text_form_field.dart';
import 'package:demo/common/languages/language_string.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 34),
            // Sign in text
            Center(child: CommonUi.commonText('Sign up')),
            const SizedBox(height: 34),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonUi.commonText('Date of birth',
                          fontSize: 18.0, fontFamily: AppFonts.bold),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hintText: 'Select',
                        readOnly: true,
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: AppColor.customGray,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonUi.commonText('Date of birth',
                          fontSize: 18.0, fontFamily: AppFonts.bold),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hintText: 'Select',
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: AppColor.customGray,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
