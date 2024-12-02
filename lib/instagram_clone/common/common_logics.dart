
class CommonLogics {
  static String? accountValidator(String? value) {
    if (value == null || value.trim() == "") {
      return "Enter email, username, phone";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.trim() == "") {
      return "Enter password";
    }
    return null;
  }
}
