import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/routing/routes_manager.dart';
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
      initialRoute: AppRoutes.home,
      getPages: RoutesManager.pages,
    );
  }
}