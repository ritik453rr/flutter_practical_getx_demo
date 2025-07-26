import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  

  void tabChange(int index) {
    if (index == 0) {
      selectedIndex.value = 0;
    }
    if (index == 2) {
      selectedIndex.value = 1;
    }
  }
}
