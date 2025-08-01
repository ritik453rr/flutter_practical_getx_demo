import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Custom dialog function
Future customDialog(){
  return Get.dialog(
    Dialog(
      backgroundColor: Colors.yellow,
      child: Wrap(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.4,
            color: Colors.yellow,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Custom Dialog"),
              ],
            ),
          ),
        ],
      ),
    ));
    
}