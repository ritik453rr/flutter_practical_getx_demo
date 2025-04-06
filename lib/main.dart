import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/language/app_language.dart';
import 'package:getx_demo/routing/app_pages.dart';
import 'routing/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.pickMedia,
      getPages: AppPages.pages,
      defaultTransition: Transition.native,
      translations: AppLanguge(),
      locale: const Locale('en', 'US'),
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
