import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class FutureBuilderView extends StatelessWidget {
  const FutureBuilderView({super.key});

  final String imgUrl = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Future Builder"),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 300,
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data.toString(),
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            //show shimmer
                            return Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              child: Container(
                                height: 500,
                                width: 300,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  ///  A future function that returns image url
  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 3));
    return imgUrl;
  }
}
