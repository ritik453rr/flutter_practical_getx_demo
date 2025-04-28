import 'package:flutter/material.dart';
import 'package:getx_demo/common/app_colors.dart';

// Custom Textfield widget
class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final Color? fillColor;
  final IconData? suffixIcon;
  final void Function()? onTapSuffixIcon;
  const CustomTextfield({
    super.key,
    this.controller,
    this.fillColor,
    this.suffixIcon,
    this.onTapSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        suffixIcon: IconButton(
          onPressed: onTapSuffixIcon,
          icon: Icon(suffixIcon),
        ),
        enabledBorder: border(),
        focusedBorder: border(),
        errorBorder: border(),
        focusedErrorBorder: border(),
      ),
    );
  }
}

OutlineInputBorder border() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.colorNeutralGray),
    borderRadius: BorderRadius.circular(20),
  );
}
