import 'package:permission_handler/permission_handler.dart';

/// Utility class for handling app permissions
class AppPermissions{
    /// Requests the required permission and returns `true` if granted.
  static Future<void> requestPermission(Permission permission) async {
    if(await permission.status.isGranted) {
      return; // Permission already granted
    }
   await permission.request();
  }

   /// Check permission
   static Future<bool> checkPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      return false; // Permission is denied
    } else if (status.isGranted) {
      return true; // Permission is granted
    } else {
      return false; // Other statuses (e.g., restricted, limited)
    }
  }
}