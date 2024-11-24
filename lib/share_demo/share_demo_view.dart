import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class ShareDemoView extends StatelessWidget {
  const ShareDemoView({super.key});
  final String msg = 'Hello jiii';
  void shareText() {
    Share.share(msg);
  }

  void shareImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    Share.shareXFiles([image], text: msg);
  }

  // Share the current screen's route (URL-like)
  void shareCurrentRoute(BuildContext context) {
    // Get the current route name
    String currentRoute =
        ModalRoute.of(context)?.settings.name ?? 'unknown route';

    // Here we treat the route name as the "URL" of the current screen
    String url =
        'https://yourapp.com/$currentRoute'; // Assuming your app uses deep links or similar routes

    // Share the "URL" of the current screen
    Share.share('Check out this link: $url');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Share ji Demo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SizedBox(
          width: 150,
          height: 35,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              //shareText();
              //shareImage();
              shareCurrentRoute(context);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Share Page",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
