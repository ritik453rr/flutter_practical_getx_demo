import 'package:get_storage/get_storage.dart';

class AppStorage {
  static var getStorage = GetStorage();

  ///Keys
  static const prefsStarted = "prefsStarted";
  static const prefPageIndex = "prefPageIndex";

/// Gets the status of preferences started
  static bool prefsStatus(){
    return getStorage.read(prefsStarted) ?? false;
  }

/// Sets the status of preferences started
  static void setPrefsStatus(bool status) {
    getStorage.write(prefsStarted, status);
  }

  /// get the current page index
  static int getPrefPageIndex() {
    return getStorage.read(prefPageIndex) ?? 0;
  }

  /// set the current page index
  static void setPrefPageIndex(int index) {
    getStorage.write(prefPageIndex, index);
  }

}