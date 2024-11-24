import 'package:demo/common/languages/translation_services.dart';
import 'package:demo/navigation/app_pages.dart';
import 'package:demo/navigation/app_routes.dart';
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
      initialRoute: AppRoutes.signIn,
      getPages: AppPages.pages,
      translationsKeys: TranslationServices().translations,
      locale: const Locale('en', 'US'),
    );
  }
}
