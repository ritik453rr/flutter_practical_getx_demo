import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

// Utility class containing global constants and helper methods
class AppConstants {
  static const double horizontalPadding = 20.0;
  static const double bottomSpace = 20;

// Hides the keyboard by removing focus from the current input field
  static hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

// Haptic feedback for the device
  static hapticFeedBack() {
    return HapticFeedback.lightImpact();
  }

  /// Checks if the device has an active internet connection
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else {
      return false;
    }
  }

// Change language
  static void changeLanguage({required int index}) {
    switch (index) {
      case 0:
        Get.updateLocale(Locale('en', 'US'));
        break;
      case 1:
        Get.updateLocale(Locale('hi', 'IN'));
    }
  }

  /// Displays a dialog when permission is denied, allowing the user to open app settings
  static void showPermissionDeniedDialog(
      {required String title, required String message}) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("OK"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              openAppSettings();
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }
}
