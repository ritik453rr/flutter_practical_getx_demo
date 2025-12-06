import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

// Utility class containing global constants and helper methods
class AppConstants {
  static const double hzPadding = 20.0;
  static const double bottomSpace = 20;
  static const tempPdfUrl =
      "https://www.ecma-international.org/wp-content/uploads/ECMA-262_12th_edition_june_2021.pdf";

// Hides the keyboard by removing focus from the current input field
  static hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

// Haptic feedback for the device
  static hapticFeedBack() {
    if (GetPlatform.isIOS) {
      return HapticFeedback.lightImpact();
    } else {
      return HapticFeedback.vibrate();
    }
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
      AlertDialog.adaptive(
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

  /// Opens a URL in the default browser
  static void openLink(String url) async {
    launchUrl(Uri.parse(url));
  }

  /// Method to set safe area color.
  static void setSafeArea({bool isDark = false}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: isDark ? AppColors.black : AppColors.bgColor,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

/// Retrieves the Android SDK version
static Future<int> androidSdkVersion()async{
  
  try {
   final int sdk = int.parse(
        (await Process.run('getprop', ['ro.build.version.sdk']))
            .stdout
            .toString()
            .trim());
            return sdk;
  } catch (_) {
       // fallback to assume Android 11+
        return 30;
  }
}

}
