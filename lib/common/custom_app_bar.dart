import 'package:demo/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.color = AppColors.customWhite,
      this.title,
      this.centerTitle = false,this.actions});
  final Color color;
  final Widget? title;
  final bool centerTitle;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      surfaceTintColor: color,
      title: title,
      centerTitle: centerTitle,
      actions:actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
