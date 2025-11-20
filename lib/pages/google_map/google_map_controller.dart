import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Controller for Google Map View
class GoogleMapViewController extends GetxController {
  /// controllers and instances
  late GoogleMapController mapController;
  late CameraPosition initialPos;

  /// Variables
  var isLoading = true;
  var showUserLoc = false;

  /// Sets
  var markers = <Marker>{};

  @override
  void onInit() {
    super.onInit();
    _setInitPos();
    _setMarkers();
  }

// Determine the current position of the device.
  Future<void> _setInitPos() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(
          "Location permissions are permanently denied, we cannot request permissions.");
    }
    Geolocator.getCurrentPosition().then((Position position) async {
      initialPos = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.0,
      );
      showUserLoc = true;
      isLoading = false;
      update();
    }).catchError((e) {
      print(e);
    });
  }

  /// set custom markers
  void _setMarkers() {
    BitmapDescriptor.asset(ImageConfiguration(size: Size(48, 48)),
            "assets/images/png_images/custom.png")
        .then((icon) {
      markers.addAll([
        Marker(
          markerId: MarkerId('dhillon_plaza'),
          position: LatLng(30.651920, 76.821850),
          infoWindow: InfoWindow(title: 'Dhillon Plaza'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('elante'),
          position: LatLng(30.704648, 76.800157),
          infoWindow: InfoWindow(title: 'Elante Mall'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('elante'),
          position: LatLng(30.704648, 76.800157),
          infoWindow: InfoWindow(title: 'Elante Mall'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('bus_stand'),
          position: LatLng(30.639580, 76.826350),
          infoWindow: InfoWindow(title: 'Zirakpur Bus Stand'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('big_bazaar'),
          position: LatLng(30.639500, 76.821900),
          infoWindow: InfoWindow(title: 'Big Bazaar'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('paras_mall'),
          position: LatLng(30.642900, 76.817000),
          infoWindow: InfoWindow(title: 'Paras Downtown Mall'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('highway'),
          position: LatLng(30.646800, 76.825600),
          infoWindow: InfoWindow(title: 'Ambala Highway'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('walmart'),
          position: LatLng(30.649800, 76.812200),
          infoWindow: InfoWindow(title: 'Best Price Walmart'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('vip_road'),
          position: LatLng(30.643300, 76.822000),
          infoWindow: InfoWindow(title: 'VIP Road'),
          icon: icon,
        ),
        Marker(
          markerId: MarkerId('patiala_road'),
          position: LatLng(30.634500, 76.829700),
          infoWindow: InfoWindow(title: 'Patiala Road'),
          icon: icon,
        ),
      ]);
      update();
    });
  }

// map created callback
  void onMapCreated(GoogleMapController ctr) {
    mapController = ctr;
  }

// map on tap callback
  void onTap(LatLng latng) {
    mapController.animateCamera(
      CameraUpdate.newLatLng(latng),
    );
  }
}
