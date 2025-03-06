import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/common/custom_button.dart';
import 'package:getx_demo/common/img_res.dart';
import 'package:pinput/pinput.dart';

class VerifyPhoneView extends StatelessWidget {
  const VerifyPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.colorLightMint,
      child: Scaffold(
        backgroundColor: AppColors.colorLightMint,
        appBar: AppBar(
          backgroundColor: AppColors.colorLightMint,
          leading: Padding(
            padding: const EdgeInsets.all(22),
            child: CommonUI.setSvgImg(ImgRes.svgIosBackArrowIcon),
          ),
          title: Text(
            "Signup",
            style: CommonUI.customTextStyle(
              fontFamily: AppFonts.bold,
              fontSize: AppFontSizes.font17,
              color: AppColors.colorSlateGray,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verify Phone",
                style: CommonUI.customTextStyle(
                  fontFamily: AppFonts.bold,
                  fontSize: 20,
                  color: AppColors.colorTealGreen,
                ),
              ),
              Text(
                " Enter 6 digit code we sent to your phone here.",
                style: CommonUI.customTextStyle(
                  fontFamily: AppFonts.fontMedium,
                  fontSize: 13,
                  color: AppColors.colorSlateGray,
                ),
              ),
              Pinput(
                length: 6,
                keyboardType: TextInputType.number,
                //controller: pinController,
                //closeKeyboardWhenCompleted: false,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: CommonUI.customTextStyle(
                    fontFamily: AppFonts.fontSemiBold,
                    fontSize: 13,
                    color: AppColors.colorSlateGray,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                //focusedPinTheme: focusedPinTheme,
                //submittedPinTheme: submittedPinTheme,
                //pinputAutovalidateMode: PinputAutovalidateMode.onUserChange,
                textInputAction: TextInputAction.next,
                showCursor: true,
                validator: (s) {
                  return s == '222222' ? null : 'Pin is incorrect';
                },
                onCompleted: (s) {
                  print('completed code: $s');
                },
              ),
              const Spacer(),
              CustomButton(
                backgroundColor: AppColors.colorPeach,
                width: double.infinity,
                onPressed: () {},
                child: Text(
                  "Finish",
                  style: CommonUI.customTextStyle(
                      color: AppColors.colorWhite,
                      fontSize: 13,
                      fontFamily: AppFonts.fontSemiBold),
                ),
              ),
              CommonUI.bottomSpace(),
            ],
          ),
        ),
      ),
    );
  }
}
