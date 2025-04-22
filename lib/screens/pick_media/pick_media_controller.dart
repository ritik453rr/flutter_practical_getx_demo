import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickMediaController extends GetxController {
  var imagePaths = ''.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    await Get.bottomSheet(
      backgroundColor: AppColors.white,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.flip_camera_ios_rounded),
            title: const Text("Take Picture"),
            onTap: () async {
              Get.back();
              if (await requestPermission(Permission.camera)) {
                print("Granted");
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
                imagePaths.value = image?.path ?? '';
              } else {
                print("not granter");
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Choose from gallery"),
            onTap: () async {
              Get.back();
              if (await requestPermission(Permission.photos)) {
                final XFile? images =
                    await picker.pickImage(source: ImageSource.gallery);
                imagePaths.value = images?.path ?? '';
              } else {
                print("Not granted");
              }
            },
          ),
        ],
      ),
    );
  }

  /// Requests the required permission and returns `true` if granted.
  Future<bool> requestPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await permission.request();
    }
    return status.isGranted;
  }
}
