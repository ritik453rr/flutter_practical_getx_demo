import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/global.dart';

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

  static roundBoxDecoration(
      {Color color = AppColors.white, double borderRadius = 20}) {
    return BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(borderRadius));
  }

  /// method to show snackbar
  static SnackbarController commonSnackBar({
    required String title,
    required String message,
  }) {
    return Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }

  /// EMPTY STATE WIDGET
  static Widget emptyState({bool scroll = true}) {
    return CustomScrollView(
      physics: scroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Empty State",
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// ON TAP EFFECT WIDGET.
  static Widget tapEffect({
    BoxDecoration? decoration,
    double borderRadius = 12,
    void Function()? onTap,
    required Widget child,
  }) {
    return Ink(
      decoration: decoration,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: Colors.grey.withOpacity(0.2),
        splashFactory: InkSparkle.splashFactory,
        onTap: () {
          AppConstants.hapticFeedBack();
          onTap?.call();
        },
        child: child,
      ),
      
    );
  }
}
