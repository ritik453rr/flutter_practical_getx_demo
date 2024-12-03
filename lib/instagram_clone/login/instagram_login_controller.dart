import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class InstagramLoginController extends GetxController {
  var accountController = TextEditingController();
  var passwordController = TextEditingController();
  var acFieldError = Rxn<String>();
  var passwordFieldError = Rxn<String>();
    /// Instance of GoogleSignIn for handling Google sign-in.
  final googleSignIn = GoogleSignIn();
  /// Observable boolean to track Google sign-in status.
  var isGoogleSignIn = false.obs;

  /// Signs in the user with Google.
  Future<void> signInWithGoogle() async {
    isGoogleSignIn.value = true;
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        debugPrint("User Name: ${googleUser.displayName}");
        debugPrint("User Email: ${googleUser.email}");
        debugPrint("Photo Url: ${googleUser.photoUrl}");
      }
    } catch (error) {
      debugPrint("Google Sign-In Error: $error");
    }
    isGoogleSignIn.value = false;
  }

  /// Signs out the user from Google.
  Future<void> signOut() async {
    await googleSignIn.signOut();
    debugPrint("User signed out");
  }

  // Validation logic for the first field
  bool validateAcField(String value) {
    if (value.isEmpty) {
      acFieldError.value = 'Enter email, username, phone';
      return false;
    } else {
      acFieldError.value = null;
      return true;
    }
  }

  // Validation logic for the second field
  bool validatePasswordField(String value) {
    if (value.isEmpty) {
      passwordFieldError.value = 'Enter password';
      return false;
    } else {
      passwordFieldError.value = null;
      return true;
    }
  }
}
