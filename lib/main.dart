import 'package:demo/instagram_clone/common/language/translation_services.dart';
import 'package:demo/instagram_clone/instagram_routing/instagram_routes.dart';
import 'package:demo/instagram_clone/instagram_routing/instagram_routes_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: const FirebaseOptions(
    apiKey: 'key',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'myapp',
    storageBucket: 'myapp-b9yt18.appspot.com',
  )
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: InstagramRoutes.instagramSplash,
      getPages: InstagramRoutesManager.pages,
      translations: TranslationServices(),
      locale: const Locale('en', 'US'),
    );
  }
}
