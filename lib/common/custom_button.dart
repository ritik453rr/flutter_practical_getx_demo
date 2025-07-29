import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double height;
  final Color? backgroundColor;
  final double width;
  final double vericalPadding;
  final double horizontalPadding;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height=50,
    this.backgroundColor,
    this.width=double.infinity,
    this.vericalPadding = 15,
    this.horizontalPadding = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            vertical: vericalPadding,
            horizontal: horizontalPadding,
          ),
        ),
        child: Text(
          title,
          style: CommonUi.customTextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontFamily: AppFonts.semiBold,
          ),
        ),
      ),
    );
  }
}
