import 'package:flutter/material.dart';

class Global {

// Hide Keybord remove focus
  static hideKeyBoard(){
  FocusManager.instance.primaryFocus?.unfocus();
  }
}
