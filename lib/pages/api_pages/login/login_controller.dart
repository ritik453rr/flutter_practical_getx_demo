import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_endpoint.dart';
import 'package:getx_demo/api_service/api_service.dart';
import 'package:getx_demo/api_service/response_model.dart';
import 'package:getx_demo/common/app_constants.dart';
import 'package:getx_demo/routing/app_routes.dart';

class LoginController extends GetxController {
  // Form key for validation

  // controllers and
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late ApiService apiService;

  // Observable variables
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

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
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Handle login
  void login() async {
    if(isLoading.value) return;
    AppConstants.hideKeyBoard();
    try {
      isLoading.value = true;
      ResponseModel respModel = await apiService.postRequest(
        baseUrl: ApiEndPoint.loginBaseUrl,
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
        Get.snackbar(
          'Login Failed',
          'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar(
        'Error',
        'Login failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
