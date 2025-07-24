import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_font_sizes.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/language/app_strings.dart';

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
    return TextStyle(fontFamily: fontFamily, color: color, fontSize: fontSize);
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

  /// A method to show an adaptive dialog with a title and content.
  static Future adaptiveDialog({String? title, required String content}) {
    return showAdaptiveDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(
            title ?? "Error",
            style: customTextStyle(fontSize: 24, color: AppColors.black),
          ),
          content: Text(
            content,
            style: customTextStyle(
              fontSize: AppFontSizes.font14,
              color: AppColors.black,
              fontFamily: AppFonts.fontMedium,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                AppStrings.ok.tr,
                style: customTextStyle(
                  color: AppColors.colorTealGreen,
                  fontFamily: AppFonts.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

/// 
  static roundBoxDecoration({Color color =AppColors.white,double borderRadius=20}) {
    return BoxDecoration(
        color:color, borderRadius: BorderRadius.circular(borderRadius));
  }

  /// method to show snackbar
  static SnackbarController commonSnackBar({
    required String title,
    required String message,
  }) {
    return Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }
}
