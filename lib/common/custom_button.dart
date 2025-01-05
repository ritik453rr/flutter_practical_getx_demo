import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height,
    this.backgroundColor,
    this.width,
    this.vericalPadding=15,
    this.horizontalPadding=15,
  });
  final void Function()? onPressed;
  final Widget? child;
  final double? height;
  final Color? backgroundColor;
  final double? width;
  final double vericalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding:  EdgeInsets.symmetric(
            vertical:vericalPadding,
            horizontal: horizontalPadding,
          ),
        ),
        child: child,
      ),
    );
  }
}
