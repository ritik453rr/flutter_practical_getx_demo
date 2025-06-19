import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_endpoint.dart';
import 'package:getx_demo/api_service/api_service.dart';
import 'package:getx_demo/api_service/response_model.dart';
import 'package:getx_demo/common/app_constants.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/routing/app_routes.dart';

/// LoginController class to handle login logicc
class LoginController extends GetxController {
  // controllers and instances
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late ApiService apiService;

  // variables
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final emailError = RxnString();
  final passwordError = RxnString();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    apiService = ApiService();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    apiService.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// validate email
  bool validateEmail() {
    final email = emailController.text;
    if (email.isEmpty) {
      emailError.value = "Enter email";
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      emailError.value = "Enter a valid email";
      return false;
    }
    emailError.value = null;
    return true;
  }

  /// validate password
  bool validatePassword() {
    final password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = "Enter password";
      return false;
    }
    passwordError.value = null;
    return true;
  }

  // Handle login
  void login() async {
    AppConstants.hideKeyBoard();
    if (!validateEmail() || !validatePassword() || isLoading.value) return;
    try {
      isLoading.value = true;
      ResponseModel respModel = await apiService.postRequest(
        url: ApiEndPoint.loginUrl,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "x-api-key": "reqres-free-v1",
        },
        body: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      if (respModel.status) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        debugPrint(respModel.message);
        CommonUi.commonSnackBar(
            title: "Login Failed", message: 'Invalid email or password');
      }
    } catch (e) {
      debugPrint("Error: $e");
      CommonUi.commonSnackBar(
          title: "Login failed", message: 'Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}
