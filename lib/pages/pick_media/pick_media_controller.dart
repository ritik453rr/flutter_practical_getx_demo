import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_constants.dart';
import 'package:getx_demo/common/app_permissions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickMediaController extends GetxController {
  var imagePaths = ''.obs;

  @override
  onInit() async {
    super.onInit();
    mediaReq();
  }

  void mediaReq()async{
    await AppPermissions.requestPermission(Permission.camera);
    AppPermissions.requestPermission(Permission.photos);
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    await Get.bottomSheet(
      backgroundColor: AppColors.white,
      Padding(
        padding: const EdgeInsets.only(bottom: 40, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.flip_camera_ios_rounded),
              title: const Text("Take Picture"),
              onTap: () async {
                Get.back();
                if (await AppPermissions.checkPermission(Permission.camera)) {
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                  imagePaths.value = image?.path ?? '';
                } else {
                  AppConstants.showPermissionDeniedDialog(
                      title: "Permission Denied",
                      message: "Please allow camera access to take pictures.");
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Choose from gallery"),
              onTap: () async {
                Get.back();
                if (await AppPermissions.checkPermission(Permission.photos)) {
                  final XFile? images =
                      await picker.pickImage(source: ImageSource.gallery);
                  imagePaths.value = images?.path ?? '';
                } else {
                  AppConstants.showPermissionDeniedDialog(
                      title: "Permission Denied",
                      message: "Please allow gallery access to choose images.");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
