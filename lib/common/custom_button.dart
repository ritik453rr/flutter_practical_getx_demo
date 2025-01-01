import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height,
    this.backgroundColor,
    this.width,
  });
  final void Function()? onPressed;
  final Widget? child;
  final double? height;
  final Color? backgroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
        ),
        child: child,
      ),
    );
  }
}
