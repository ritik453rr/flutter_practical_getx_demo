import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:shimmer/shimmer.dart';

/// AppShimmers is a class that contains all the shimmers for the app.
class AppShimmers {
  /// todoItemShimmer creates a realistic loading placeholder for todo items
  static Widget todoItemShimmer() {
    return ListView.builder(
      itemCount: 15,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 10),
            height: 50,
            width: Get.width,
          ),
        );
      },
    );
  }
}
