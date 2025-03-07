import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Global {

// Hide Keybord remove focus
  static hideKeyBoard(){
  FocusManager.instance.primaryFocus?.unfocus();
  }

  
/// Function to check the internet connection using the connectivity_plus package
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else {
      return false;
    }
  }

}
