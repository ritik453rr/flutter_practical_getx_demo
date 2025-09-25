import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_storage.dart';
import 'package:getx_demo/language/app_language.dart';
import 'package:getx_demo/routing/app_pages.dart';
import 'global.dart';
import 'routing/app_routes.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Global.setSafeArea();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      defaultTransition: Transition.rightToLeft,
      translations: AppLanguge(),
      locale: const Locale('en', 'US'),
      initialRoute: AppRoutes.splash,
      //googleMap,
      //slidePanel,
      // .slidePanel,
      // AppStorage.isLogin()?AppRoutes.home:AppRoutes.login,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
