import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_demo/Dialog/app_adaptive_dialog.dart';
import 'package:getx_demo/Dialog/custom_dialog.dart';
import 'package:getx_demo/common/app_storage.dart';

class LabelPreferencesController extends GetxController {
  late int pageIndex;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageIndex = AppStorage.getPrefPageIndex();
    pageController = PageController(initialPage: pageIndex);
  }

  void onPageChanged(int index) {
    pageIndex = index;
    AppStorage.setPrefPageIndex(pageIndex);
  }

  void onTapNext() {
    if (pageIndex < 3) {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
}
