import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/pages/dashboard/home/home_view.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  var dashScreens = <Widget>[
    LabelHome(),
    Center(child: Text("Profile")),
  ];

  void tabChange(int index) {
    if (index == 0) {
      selectedIndex.value = 0;
    }
    if (index == 2) {
      selectedIndex.value = 1;
    }
  }
}
