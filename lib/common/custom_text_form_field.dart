import 'package:demo/common/app_color.dart';
import 'package:demo/common/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.hintTextSize = 14.0,
    this.inputTextColor = AppColor.customWhite,
    this.inputTextSize = 14.0,
    this.inputTextFamily = AppFonts.regular,
    this.hintTextColor = AppColor.customLightGray,
    this.hintTextFamily = AppFonts.regular,
    this.suffixIcon,
    this.obscure = false,
    this.controller,
    this.readOnly=false,
  });

  final String? hintText;
  final double hintTextSize;
  final Color hintTextColor;
  final String hintTextFamily;
  final Color inputTextColor;
  final double inputTextSize;
  final String inputTextFamily;
  final Widget? suffixIcon;
  final bool obscure;
  final TextEditingController? controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
    readOnly: readOnly,
      cursorColor: AppColor.customWhite,
      style: TextStyle(
          color: inputTextColor,
          fontSize: inputTextSize,
          fontFamily: inputTextFamily),
      decoration: InputDecoration(
        fillColor: AppColor.customWhiteOpacity,
        filled: true,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: hintTextSize,
            fontFamily: hintTextFamily),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
      ),
    );
  }
}
