import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/pages/google_map/google_map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatelessWidget {
  GoogleMapView({super.key});
  final controller = Get.find<GoogleMapViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(

          () =>
          controller.isLoading.value?
          Center(child: CircularProgressIndicator()):
           GoogleMap(
            key: controller.mapKey.value,
            zoomControlsEnabled: false,
            markers: controller.markers,
            myLocationEnabled: true,
            initialCameraPosition: controller.initPos,
            onMapCreated: (ctr) {
              controller.onMapCreated(ctr);
            },
            onTap: (latng) {
              controller.onTap(latng);
            },
          
          ),
        ),
      ),
    );
  }
}
