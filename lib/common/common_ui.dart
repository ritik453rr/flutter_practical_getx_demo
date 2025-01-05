import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_fonts.dart';

class CommonUI {
  /// Set PNG image
  static Widget setPngImg(String imgName,
      {BoxFit? fit, Color? color, double? width, double? height}) {
    return Image.asset(
      'assets/images/png_images/$imgName.png',
      fit: fit,
      color: color,
      width: width,
      height: height,
    );
  }

  /// Set SVG image
  static Widget setSvgImg(String imgName,
      {BoxFit fit = BoxFit.contain,
      Color? color,
      double? width,
      double? height}) {
    return SvgPicture.asset(
      'assets/images/svg_images/$imgName.svg',
      fit: fit,
      color: color,
      width: width,
      height: height,
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

  static Widget bottomSpace({
    double height = 36,
  }) {
    return SizedBox(
      height: height,
    );
  }
}
