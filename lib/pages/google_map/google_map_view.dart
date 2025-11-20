import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/pages/google_map/google_map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// View to display Google Map
class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GoogleMapViewController>(builder: (controller) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  initialCameraPosition: controller.initialPos,
                  markers: controller.markers,
                  myLocationEnabled: !controller.isLoading,
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
