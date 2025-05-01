import 'package:flutter/material.dart';
/// Custom App Bar widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final Color backgroundColor;
  const CustomAppBar({super.key, required this.title,this.centerTitle=false,
  this.backgroundColor=Colors.white,
  
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,

    );
  } 

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
