import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/custom_app_bar.dart';
import 'package:getx_demo/common/custom_textfield.dart';
import 'package:getx_demo/pages/stream_builder/stream_builder_controller.dart';

class StreamBuilderView extends GetView<StreamBuilderController> {
  StreamBuilderView({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Stream Builder"),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: controller.streamSoket.getResponse,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: 100,
                        width: 100,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        return Text(controller.list[index]);
                      },
                    );
                  }),
            ),
            CustomTextfield(
              controller: controller.msgController,
              suffixIcon: Icons.send,
              onTapSuffixIcon: () {
                controller.list.add(controller.msgController.text);
                controller.streamSoket.addResponse(controller.list);
                controller.msgController.clear();
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Stream<int> generateNumber() async* {
    for (int i = 0; i < 20; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
}


