import 'package:flutter/material.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_fonts.dart';

class CommonUI {
  /// Set PNG image
  static Widget setPngImg(String imgName,
      {BoxFit? fit, Color? color, double? width, w}) {
    return Image.asset(
      'assets/images/png_images/$imgName.png',
      fit: fit,
      color: color,
      width: width,
    );
  }

  /// Custom Text Style
  static TextStyle? customTextStyle({
    Color color = AppColors.black,
    double fontSize = 13,
    String fontFamily = AppFonts.regular,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
    );
  }
}
