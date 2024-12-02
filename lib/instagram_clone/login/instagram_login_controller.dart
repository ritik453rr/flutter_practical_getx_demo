import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstagramLoginController extends GetxController {
  var accountController = TextEditingController();
  var passwordController = TextEditingController();
  var acFieldError = Rxn<String>();
  var passwordFieldError = Rxn<String>();

  // Validation logic for the first field
  bool validateAcField(String value) {
    if (value.isEmpty) {
      acFieldError.value = 'Enter email, username, phone';
      return false;
    } else {
      acFieldError.value = null;
      return true;
    }
  }

  // Validation logic for the second field
  bool validatePasswordField(String value) {
    if (value.isEmpty) {
      passwordFieldError.value = 'Enter password';
      return false;
    } else {
      passwordFieldError.value = null;
      return true;
    }
  }
}
