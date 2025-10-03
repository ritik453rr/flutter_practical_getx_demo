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
        child: GetBuilder<GoogleMapViewController>(builder: (cont) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  markers: controller.markers,
                  myLocationButtonEnabled: controller.showUserLoc,
                  myLocationEnabled: controller.showUserLoc,
                  initialCameraPosition: controller.initialPos,
                  onMapCreated: (ctr) {
                    controller.onMapCreated(ctr);
                  },
                  onTap: (latng) {
                    controller.onTap(latng);
                  },
                );
        }),
      ),
    );
  }
}
