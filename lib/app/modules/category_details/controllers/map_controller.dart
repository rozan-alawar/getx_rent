import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../API/custom_snack_bar.dart';
import '../views/location/map_view.dart';

class MapController extends GetxController {
  GoogleMapController? mapController;
  Rx<LatLng> selectedLocation = const LatLng(21.5169, 39.1979).obs;
  LatLng? tappedLocation;

  RxBool showLocation = false.obs;

  saveLocation(bool value) {
    showLocation.value = value;
  }

  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(21.5169, 39.1979), zoom: 8);
  Set<Marker>? markers;
  RxString currentAddress = ''.obs;
  CameraPosition? currentPosition;
  LatLng? currentLocation;

  RxBool isLoading = false.obs;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'error'.tr,
        message: 'location_services_disabled'.tr,
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CustomSnackBar.showCustomErrorSnackBar(
          message: 'location_permissions_denied'.tr,
          title: 'error'.tr,
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      CustomSnackBar.showCustomErrorSnackBar(
        message: 'location_permissions_denied_permanently'.tr,
        title: 'error'.tr,
      );
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    isLoading = true.obs;
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    isLoading.value = false;
    currentLocation = LatLng(position.latitude, position.longitude);
    currentPosition = CameraPosition(target: currentLocation!, zoom: 20);
    update();
  }

  Future<String> getAddressFromLatLong(LatLng position) async {
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final address = placemarks[0].name;
    final city = placemarks[0].locality;
    final state = placemarks[0].administrativeArea;
    final country = placemarks[0].country;

    return '$address, $city, $state, $country';
  }

  @override
  void onInit() {
    super.onInit();
    _getCurrentPosition();
    markers = {};
  }

  void setSelectedLocation(LatLng location) {
    selectedLocation.value = location;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void addMarker(LatLng position) async {
    final BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(48, 48),
      ),
      'assets/icons/location marker.png',
    );

    final Marker newMarker = Marker(
      markerId: const MarkerId('new_marker'),
      position: selectedLocation.value,
      icon: markerIcon,
    );

    markers!.add(newMarker);
    update();
  }

  void handleTap() async {
    final LatLng newLocation = await Get.bottomSheet(
      MapView(
        selectedLocation: selectedLocation.value,
      ),
      isScrollControlled: true,
    );

    selectedLocation.value = newLocation;
    currentAddress.value = await getAddressFromLatLong(selectedLocation.value);
  }

  void onMapTapped(LatLng location) {
    tappedLocation = location;
  }
}
