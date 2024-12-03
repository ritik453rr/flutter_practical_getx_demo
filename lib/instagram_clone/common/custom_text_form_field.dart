import 'package:demo/instagram_clone/common/app_colors.dart';
import 'package:demo/instagram_clone/common/instagram_fonts.dart';
import 'package:demo/instagram_clone/login/instagram_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.hintText,
    this.color = AppColors.lightGray,
    this.validator,
    this.controller,
    this.onChanged,
    this.errorText,
  });

  final String? hintText;
  final Color color;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final InstagramLoginController loginController = InstagramLoginController();
  final void Function(String)? onChanged;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.deepBlack,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'^\s+')), // Deny leading space
      ],
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
            color: AppColors.hintGray,
            fontSize: 14,
            fontFamily: InstagramFonts.regular),
        hoverColor: color,
        fillColor: color,
        filled: true,
        errorStyle: const TextStyle(color: AppColors.brightRed),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.borderGray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.borderGray,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.brightRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.borderGray),
        ),
      ),
    );
  }
}
