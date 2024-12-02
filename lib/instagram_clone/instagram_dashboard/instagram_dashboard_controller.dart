import 'package:demo/instagram_clone/common/common_ui.dart';
import 'package:demo/instagram_clone/home/instagram_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class InstagramDashboardController extends GetxController {
  var itemIndex = 0.obs;

  /// Controller for managing the state of the bottom navigation bar.
  final bottomNavController = PersistentTabController(initialIndex: 0);

  /// List of screens for the bottom navigation bar.
  final navScreens = [
    InstagramHomeView(),
    const Center(
      child: Text("Search View"),
    ),
    const Center(
      child: Text("Add Post View"),
    ),
    const Center(
      child: Text("Favorite View"),
    ),
    const Center(
      child: Text("Profile View"),
    ),
  ];

  /// Updates the current index when a tab is selected.
  void onItemSelected(int index) {
    itemIndex.value = index;
  }

  /// List of items for the bottom navigation bar.
  final navItems = [
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage('home_active_icon'),
      inactiveIcon:
          CommonUi.setSvgImage('home_inactive_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage('search_active_icon'),
      inactiveIcon:
          CommonUi.setSvgImage('search_inactive_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage('add_post_active_icon'),
      inactiveIcon:
          CommonUi.setSvgImage('add_post_inactive_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage('favorite_active_icon'),
      inactiveIcon:
          CommonUi.setSvgImage('favorite_inactive_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setPngImage('profile_image', height: 30, width: 30),
    ),
  ];
}
