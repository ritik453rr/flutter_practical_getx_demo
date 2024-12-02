import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:demo/instagram_clone/common/app_colors.dart';
import 'package:demo/instagram_clone/instagram_dashboard/instagram_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class InstagramDashBoardView extends StatelessWidget {
   InstagramDashBoardView({super.key});

  final InstagramDashboardController instagramDashboardController =
      InstagramDashboardController();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.customWhite,
      bottom: false,
      child: Scaffold(
        body: instagramDashboardController.navScreens[1],
        bottomNavigationBar: PersistentTabView(
          onItemSelected: instagramDashboardController.onItemSelected,
          navBarHeight: 78,
          context,
          controller: instagramDashboardController.bottomNavController,
          decoration: const NavBarDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              )
            )
          ),
          items: instagramDashboardController.navItems,
          screens: instagramDashboardController.navScreens,
          backgroundColor: AppColors.customWhite,
          navBarStyle: NavBarStyle.style6,
        ),
      ),
    );
  }
}
