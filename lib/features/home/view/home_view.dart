import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/extension/app_extension.dart';
import 'package:getx_demo/app_constants.dart';
import 'package:getx_demo/routing/app_routes.dart';
import '../home_controller.dart';

/// HomeView is the main view of the home page
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
        actionsPadding: const EdgeInsets.only(right: 12),
        actions: [
          CommonUi.onTapEffect(
            borderRadius: 50,
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              CommonUi.appButton(
                title: "User List Api",
                onTap: () {
                  // Get.toNamed(AppRoutes.userList);
                  // showTooltip(context, "Download File from Internet");
                },
              ),
              2.h,
              CommonUi.appButton(
                title: "Contacts",
                onTap: () {
                  // Get.toNamed(AppRoutes.appContact);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
