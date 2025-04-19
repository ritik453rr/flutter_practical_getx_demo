import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/app_fonts.dart';

class CommonUi {
  /// Set PNG image
  static Widget setPngImg(
    String imgName, {
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.asset(
      'assets/images/png_images/$imgName.png',
      fit: fit,
      color: color,
      width: width,
      height: height,
    );
  }

  /// Set SVG image
  static Widget setSvgImg(
    String imgName, {
    Color? color,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
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
    double fontSize = 14,
    String fontFamily = AppFonts.regular,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      
    );
  }


  /// method to show toast message.
  static Future appToast({required String toastMsg}) {
    return Fluttertoast.showToast(
      msg: toastMsg.toString(),
      backgroundColor: Colors.grey[800],
      toastLength: Toast.LENGTH_SHORT,
      textColor: AppColors.white,
      fontSize: AppFontSizes.font16,
    );
  }
}
