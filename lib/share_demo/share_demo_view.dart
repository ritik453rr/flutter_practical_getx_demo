import 'package:demo/common/app_fonts.dart';
import 'package:demo/common/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:demo/common/language/language_string.dart';

class ShareDemoView extends StatelessWidget {
  const ShareDemoView({super.key});

  // A constant string message used for sharing
  final String msg = 'Hello Demo';

  /// Shares a text message using the Share package.
  void shareText() => Share.share(msg);

  /// Shares an image from the device's gallery.
  Future<void> shareImage() async {
    // Picking an image from the gallery
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    // If an image is picked, share it with the message
    if (image != null) {
      Share.shareXFiles([image], text: msg);
    }
  }

  /// Shares the current route URL of the app.
  void shareCurrentRoute(BuildContext context) {
    final currentRoute =
        ModalRoute.of(context)?.settings.name ?? 'unknown route';
    final url = 'https://yourapp.com/$currentRoute';
    Share.share('Check out this link: $url');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Picker, Flutter Share",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () {
            shareImage();
            // Get.updateLocale(
            //   const Locale('ur', 'PK'),
            // );
          }, // Triggering the shareImage function
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Ensure the button size fits its content
            children: [
              const Icon(Icons.share, color: Colors.white, size: 19),
              const SizedBox(width: 5),
              CommonUi.commomText(LanguageString.share.tr,
                  fontFamily: AppFonts.medium, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
