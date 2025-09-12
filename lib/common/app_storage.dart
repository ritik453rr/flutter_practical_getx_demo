import 'package:get_storage/get_storage.dart';

class AppStorage {
  static var getStorage = GetStorage();

  // ///Keys
  static const loginStatus = "login_staus";

  static bool isLogin() {
    return getStorage.read(loginStatus) ?? false;
  }

  static void setLogin(bool val) {
    getStorage.write(loginStatus, val);
  }
}
