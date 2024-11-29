import 'package:demo/common/language/translation_services.dart';
import 'package:demo/routing/app_routes.dart';
import 'package:demo/routing/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      getPages: RoutesManager.pages,
      translations: TranslationServices(),
      locale: const Locale('en', 'US'),
    );
  }
}
