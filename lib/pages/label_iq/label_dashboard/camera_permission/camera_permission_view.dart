import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/custom_button.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/camera_permission/camera_permission_controller.dart';

class CameraPermissionView extends StatelessWidget {
  CameraPermissionView({super.key});
  final controller = Get.find<CameraPermissionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onPressed: () {
                  controller.checkCameraPermission();
                },
                title: "Enable Camera Permission"),
          ],
        ),
      ),
    ));
  }
}
