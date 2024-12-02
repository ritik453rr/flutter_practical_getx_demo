import 'package:demo/instagram_clone/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.color = AppColors.customWhite,
      this.title,
      this.centerTitle = false,
      this.actions,
      this.leading,
      this.leadingWidth});
  final Color color;
  final Widget? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final double? leadingWidth;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      leadingWidth: leadingWidth,
      backgroundColor: color,
      surfaceTintColor: color,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
