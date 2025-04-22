import 'package:flutter/material.dart';
import 'package:getx_demo/common/app_colors.dart';

// Custom Textfield widget
class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorNeutralGray),
        ),
      ),
    );
  }
}