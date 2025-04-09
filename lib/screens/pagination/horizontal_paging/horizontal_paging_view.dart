import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:get/get.dart';
import 'package:getx_demo/screens/pagination/horizontal_paging/horizontal_paging_controller.dart';
import 'package:getx_demo/screens/pagination/horizontal_paging/services/backend_services.dart';
import 'package:getx_demo/screens/pagination/horizontal_paging/widgets/horizontal_paging_widgets.dart';

class HorizontalPagingView extends GetView<HorizontalPagingController> {
  const HorizontalPagingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: PagewiseListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                pageSize: controller.pageSize,
                loadingBuilder: (context) => Container(
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                itemBuilder: postBuilder,
                pageFuture: (pageIndex) => BackendService.getPosts(
                  pageIndex! * controller.pageSize,
                  controller.pageSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
