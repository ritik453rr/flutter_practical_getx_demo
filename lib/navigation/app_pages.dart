import 'package:demo/navigation/app_routes.dart';
import 'package:demo/sign_in/sign_in_binding.dart';
import 'package:demo/sign_in/sign_in_view.dart';
import 'package:demo/sign_up/sign_up_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInView(),
      binding: SingInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignUpView(),
    ),
  ];
}
