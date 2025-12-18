import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/extension/app_extension.dart';
import 'package:getx_demo/pages/api_pages/download_file/download_file_controller.dart';

class DownloadFileView extends StatelessWidget {
  DownloadFileView({super.key});
  final controller = Get.find<DonwloadFileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => Text(
                "${controller.fileDownloadProgress.value.toStringAsFixed(2)}%"),
          ),
          10.w,
          CommonUi.tapEffect(
            onTap: () {
              controller.getDownloadDir();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Download"),
            ),
          ),
        ],
      ),
      body: Center(child: Text("Download File")),
    );
  }
}
