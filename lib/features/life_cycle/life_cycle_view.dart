import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/features/life_cycle/life_cycle_controller.dart';
import 'package:getx_demo/routing/app_routes.dart';

class LifeCycleView extends StatelessWidget {
  LifeCycleView({super.key});
  final controller = Get.find<LifeCycleController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // Get.offNamed(AppRoutes.slidePanel);
              },
              icon: Icon(Icons.route))
        ],
      ),
      body: Center(child: Text("Life Cyle")),
    );
  }
}
