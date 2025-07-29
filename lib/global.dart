import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/database/app_database.dart' as drift;
import 'package:getx_demo/database/app_database.dart';
import 'package:getx_demo/database/database_quries.dart';
import 'package:getx_demo/database/static_resources.dart';
import 'package:permission_handler/permission_handler.dart';

// Utility class containing global constants and helper methods
class Global {
  static const double horizontalPadding = 20.0;
  static const double bottomSpace = 20;
  static var database = drift.AppDatabase();
  static var prefOptions = <PrefEntityData>[].obs;

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

  /// Initializes the database and checks if preferences exist.
  static Future<void> initDatabase() async {
    final result = database.select(database.prefEntity)..limit(1);
    final rows = await result.get();
    if (rows.isEmpty) {
      await DatabaseQuries.insertPrefList(StaticResources.onboardOptions);
      DatabaseQuries.watchAllPreferences().listen((data) {
        prefOptions.value = data;
      });
    } else {
      DatabaseQuries.watchAllPreferences().listen((data) {
        prefOptions.value = data;
      });
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
