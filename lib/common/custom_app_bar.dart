import 'package:flutter/material.dart';
import 'package:getx_demo/common/app_colors.dart';

/// Custom App Bar widget
AppBar customAppBar(
    {required String title,
    bool centerTitle = false,
    Color backgroundColor = AppColors.white}) {
  return AppBar(
    title: Text(title),
    centerTitle: centerTitle,
    backgroundColor: backgroundColor,
    surfaceTintColor: backgroundColor,
  );
}
