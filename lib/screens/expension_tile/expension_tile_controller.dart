import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensionTileController extends GetxController {
  var dateSwitch = false.obs;
  var dateController = ExpansionTileController();

  var timeSwitch = false.obs;
  var timeController = ExpansionTileController();

  /// toggle dateSwitch value
  void toggleDateSwitch(bool val) {
    dateSwitch.value = val;
  }

  void toggleTimeSwitch(bool val) {
    timeSwitch.value = !timeSwitch.value;
  }

  ///
  void handleDateExpension() {
    dateSwitch.value ? dateController.collapse() : dateController.expand();
  }

  void handleTimeExpension() {
    timeSwitch.value ? timeController.collapse() : timeController.expand();
  }
}
