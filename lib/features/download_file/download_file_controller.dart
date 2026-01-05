import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:getx_demo/network/api_service.dart';
import 'package:getx_demo/network/model/response_model.dart';

class DonwloadFileController extends GetxController {
  var fileDownloadProgress = 0.0.obs;
  String? downloadDir;

  /// Checks storage permission and initiates file download
  void getDownloadDir(
      {String url =
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"}) async {
    if (downloadDir == null) {
      downloadDir = await FilePicker.platform.getDirectoryPath(
        dialogTitle: "Select Download Folder",
      );
      if (downloadDir != null) {
        downloadFile(url: url, path: downloadDir!);
      }
    } else {
      downloadFile(url: url, path: downloadDir!);
    }
  }

  /// Downloads a file from the given URL
  Future<void> downloadFile({required String url, required String path}) async {
    final ResponseModel resModel = await ApiService().downloadMedia(
      url: url,
      dirPath: path,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          fileDownloadProgress.value = (received / total) * 100;
        }
      },
    );

    if (resModel.status) {
      print(resModel.message);
    } else {
      print("False");
    }
  }
}
