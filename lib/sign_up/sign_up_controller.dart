import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController dateController = TextEditingController();

  void onDateSelect(String date) {
    dateController.text = date;
  }
}
