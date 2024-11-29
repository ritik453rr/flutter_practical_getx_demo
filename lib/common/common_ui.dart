import 'package:demo/common/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonUi {
  static Widget commomText(String? text,
      {double fontSize = 14,
      Color color = Colors.black,
      String fontFamily = AppFonts.regular}) {
    return Text(
      text ?? "",
      style:
          TextStyle(fontSize: fontSize, color: color, fontFamily: fontFamily),
    );
  }

  static Widget setPngImage(String imageName,
      {double? height, double? width, Color? color}) {
    return Image.asset(
      "assets/images/$imageName.png",
      height: height,
      width: width,
      color: color,
    );
  }

  static setSvgImage(String imageName,
      {double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      "assets/svg_images/$imageName.svg",
      height: height,
      width: width,
      color: color,
    );
  }
}
