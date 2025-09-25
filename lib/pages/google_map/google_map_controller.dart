import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class GoogleMapViewController extends GetxController {
  /// controllers
  late GoogleMapController googleMapController;

  /// Variables
  var isLoading = true.obs;
  var mapKey = UniqueKey().obs;
  static late BitmapDescriptor customIcon;
  late CameraPosition initPos;

  /// Lists
  var markers = <Marker>{}.obs;

  @override
  void onInit() async {
    super.onInit();
    checkLocPermission();
  }

  Future<void> checkLocPermission() async {
    var locPermission = Permission.location;
    if (await locPermission.status.isDenied) {
      await locPermission.request();
      if (await locPermission.isGranted) {
        // mapKey.value = UniqueKey();
        loadCustomMarker();
      await goToUserLocation();
      isLoading.value = false;
      }
    } else if (await locPermission.status.isPermanentlyDenied) {
      openAppSettings();
    } else {
      loadCustomMarker();
      await goToUserLocation();
      isLoading.value = false;
    }
  }

// get user current location
  Future<void> goToUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check location services
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Location Error", "Location services are disabled.");
      return;
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Permission Denied", "Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          "Permission Denied", "Location permissions are permanently denied.");
      return;
    }

    // Get current position
    final position = await Geolocator.getCurrentPosition();
    final userLatLng = LatLng(position.latitude, position.longitude);
    initPos = CameraPosition(
      target: userLatLng,
      zoom: 14.4746,
    );

  
  }

/// method to change marker icon
  Future<void> loadCustomMarker() async {
    customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)), // Optional sizing
      'assets/images/png_images/traveller.png',
    );
    markers.addAll({
      Marker(
          markerId: MarkerId('dhillon_plaza'),
          position: LatLng(30.651920, 76.821850),
          infoWindow: InfoWindow(title: 'Dhillon Plaza'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('elante'),
          position: LatLng(30.704648, 76.800157),
          infoWindow: InfoWindow(title: 'Elante Mall'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('bus_stand'),
          position: LatLng(30.639580, 76.826350),
          infoWindow: InfoWindow(title: 'Zirakpur Bus Stand'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('big_bazaar'),
          position: LatLng(30.639500, 76.821900),
          infoWindow: InfoWindow(title: 'Big Bazaar'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('paras_mall'),
          position: LatLng(30.642900, 76.817000),
          infoWindow: InfoWindow(title: 'Paras Downtown Mall'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('highway'),
          position: LatLng(30.646800, 76.825600),
          infoWindow: InfoWindow(title: 'Ambala Highway'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('walmart'),
          position: LatLng(30.649800, 76.812200),
          infoWindow: InfoWindow(title: 'Best Price Walmart'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('vip_road'),
          position: LatLng(30.643300, 76.822000),
          infoWindow: InfoWindow(title: 'VIP Road'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('patiala_road'),
          position: LatLng(30.634500, 76.829700),
          infoWindow: InfoWindow(title: 'Patiala Road'),
          icon: customIcon),
      Marker(
          markerId: MarkerId('metro_site'),
          position: LatLng(30.627800, 76.845500),
          infoWindow: InfoWindow(title: 'Proposed Metro Site (Dhakoli)'),
          icon: customIcon),
    });
  }

  void onMapCreated(GoogleMapController ctr) {
    googleMapController = ctr;
  }

  void onTap(LatLng latng) {
    googleMapController.animateCamera(
      CameraUpdate.newLatLng(latng),
    );
  }
}
