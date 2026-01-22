import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

extension SizedBoxExtension on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension Skeletonize on Widget {
  Widget skeletonizerWidget({
    bool enabled = false,
    bool ignorePointers = true,
    bool ignoreContainers = false,
  }) => Skeletonizer(
    enabled: enabled,
    ignorePointers: ignorePointers,
    effect: ShimmerEffect(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.white,
      duration: const Duration(milliseconds: 1600),
    ),
    ignoreContainers: ignoreContainers,
    child: this,
  );
}