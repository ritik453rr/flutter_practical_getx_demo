import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/features/web_view/app_web_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatelessWidget {
  AppWebView({super.key});
  final controller = Get.find<AppWebController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final canGoBack = await controller.webController.canGoBack();
        if (canGoBack) {
          controller.webController.goBack();
          return false; // Prevents popping the Flutter screen
        }
        return true; // Allows screen to be popped
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: WebViewWidget(
            controller: controller.webController,
          ),
        ),
      ),
    );
  }
}
