import 'package:demo/common/app_color.dart';
import 'package:demo/common/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonUi {
  static setPngImage(String imageName, {double? height, double? width}) {
    return Image.asset('assets/images/$imageName.png',
        height: height, width: width);
  }

  static setSvgImage(String imageName, {double? height, double? width}) {
    return SvgPicture.asset('assets/svg_images/$imageName.svg',
        height: height, width: width);
  }

  static Text commonText(text,
      {fontSize = 36.0,
      color = AppColor.customWhite,
      fontFamily = AppFonts.bold}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
