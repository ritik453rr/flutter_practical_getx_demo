import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/language/app_language.dart';
import 'package:getx_demo/routing/app_pages.dart';
import 'routing/app_routes.dart';

// Entry point of the application
void main() {
  runApp(const MyApp());
}

// Root widget of the application that configures GetX and basic app settings
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Builds the root widget tree with GetMaterialApp configuration
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
      defaultTransition: Transition.native,
      translations: AppLanguge(),
      locale: const Locale('en', 'US'),
    );
  }
}
