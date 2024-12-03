import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:demo/instagram_clone/common/app_colors.dart';
import 'package:demo/instagram_clone/common/instagram_fonts.dart';
import 'package:demo/instagram_clone/common/instagram_keys.dart';
import 'package:demo/instagram_clone/common/common_logics.dart';
import 'package:demo/instagram_clone/common/common_ui.dart';
import 'package:demo/instagram_clone/common/custom_text_form_field.dart';
import 'package:demo/instagram_clone/common/language/language_string.dart';
import 'package:demo/instagram_clone/login/instagram_login_controller.dart';
import 'package:demo/instagram_clone/instagram_routing/instagram_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_btn/loading_btn.dart';

/// Instagram Login Screen
class InstagramLoginView extends StatelessWidget {
  InstagramLoginView({super.key});

  /// Instance of the login controller to manage state and logic.
  final InstagramLoginController loginController = InstagramLoginController();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.customWhite,
      child: GestureDetector(
        // Dismisses the keyboard when the user taps outside input fields.
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 86),

                    // Instagram logo
                    CommonUi.setPngImage(
                      "instagram_text",
                      height: 50,
                      width: 182,
                    ),
                    const SizedBox(height: 34),

                    // Email, username, or phone number input field
                    Obx(
                      () => CustomTextFormField(
                        hintText: LanguageString.emailUserNamePhone.tr,
                        controller: loginController.accountController,
                        validator: CommonLogics.accountValidator,
                        errorText: loginController.acFieldError.value,
                        onChanged: loginController.validateAcField,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Password input field
                    Obx(
                      () => CustomTextFormField(
                        hintText: LanguageString.password.tr,
                        controller: loginController.passwordController,
                        validator: CommonLogics.passwordValidator,
                        errorText: loginController.passwordFieldError.value,
                        onChanged: loginController.validatePasswordField,
                      ),
                    ),
                    const SizedBox(height: 63),

                    // Login button
                    _buildLoginButton(context),
                    const SizedBox(
                      height: 20,
                    ),
                    //Login with google
                    Obx(
                      () => loginController.isGoogleSignIn.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.borderGray),
                            )
                          : GestureDetector(
                              onTap: () {
                                loginController.signInWithGoogle();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CommonUi.commomText("Log in with google",
                                      fontSize: 16,
                                      fontFamily: InstagramFonts.medium),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CommonUi.setSvgImage("google_icon"),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        loginController.signOut();
                                      },
                                      icon: const Icon(Icons.logout),),
                                ],
                              ),
                            ),
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the login button with loading functionality.
  Widget _buildLoginButton(BuildContext context) {
    return LoadingBtn(
      height: 48,
      width: double.infinity,
      color: AppColors.skyBlue,
      borderRadius: 5,
      roundLoadingShape: false,
      loader: const CircularProgressIndicator(
        color: AppColors.customWhite,
        strokeWidth: 3,
      ),
      onTap: (startLoading, stopLoading, btnState) {
        // Validate the form and start loading if valid.
        if (loginController
                .validateAcField(loginController.accountController.text) &&
            loginController.validatePasswordField(
                loginController.passwordController.text)) {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
          startLoading();
          Future.delayed(
            const Duration(seconds: 1),
            () {
              stopLoading();
              Get.offNamed(InstagramRoutes.instagramHome); // Navigate to home
              GetStorage()
                  .write(InstagramKeys.isLogged, true); // Persist login status
            },
          );
        }
      },
      child: CommonUi.commomText(
        LanguageString.login.tr,
        fontSize: 14,
        fontFamily: InstagramFonts.semibold,
        color: AppColors.customWhite,
      ),
    );
  }
}
