import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/screens/stream_builder/stream_socket.dart';

class StreamBuilderController extends GetxController {
  var msgController = TextEditingController();
  List<String> list = [];
  final StreamsSoket streamSoket = StreamsSoket();

  @override
  void onInit() {
    super.onInit();
    streamSoket.addResponse(list);
  }
}
