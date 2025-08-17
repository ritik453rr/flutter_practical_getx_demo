import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Controller for the App Web feature
class AppWebController extends GetxController{
    late WebViewController webController;

    @override
  void onInit() {
    super.onInit();
    webController = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }


}