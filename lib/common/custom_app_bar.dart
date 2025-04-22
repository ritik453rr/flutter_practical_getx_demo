import 'package:flutter/material.dart';
/// Custom App Bar widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,

    );
  } 

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
