import 'package:get/get.dart';

class SignInController extends GetxController{
  var passwordVisible = false.obs;

  void changePasswordVisibility(){
    passwordVisible.value = !passwordVisible.value;
  }

}