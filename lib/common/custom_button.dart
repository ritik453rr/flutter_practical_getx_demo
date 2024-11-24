import 'package:demo/common/app_color.dart';
import 'package:demo/common/app_fonts.dart';
import 'package:demo/common/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.buttonHeight = 55.0,
      this.buttonWidth = 240.0,
      this.buttonName,
      this.buttonColor = AppColor.customGreen,
      this.buttonNameColor = AppColor.customWhite,
      this.buttonNameSize = 18.0,
      this.buttonNameFamily = AppFonts.bold,
      this.buttonBorderRadius = 62.0,
      required this.onPressed});

  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonBorderRadius;
  final String? buttonName;
  final Color buttonNameColor;
  final double buttonNameSize;
  final String buttonNameFamily;
  final Function(
          Function startLoading, Function stopLoading, ButtonState btnState)
      onPressed;

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
      onTap: (startLoading, stopLoading, btnState) async {
        onPressed.call(startLoading, stopLoading, btnState);
      },
      height: buttonHeight,
      width: buttonWidth,
      borderRadius: buttonBorderRadius,
      color: buttonColor,
      loader: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
      child: CommonUi.commonText(buttonName,
          color: buttonNameColor,
          fontSize: buttonNameSize,
          fontFamily: buttonNameFamily),
    );
  }
}
