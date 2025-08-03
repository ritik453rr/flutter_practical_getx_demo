import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/language/app_language.dart';
import 'package:getx_demo/routing/app_pages.dart';
import 'routing/app_routes.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
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
      getPages: AppPages.pages,
      defaultTransition: Transition.rightToLeft,
      translations: AppLanguge(),
      locale: const Locale('en', 'US'),
      initialRoute: AppRoutes.dashboard,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
