import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';

class LbsTrackingController extends GetxController {
  //Map Variable
  var currentLocation = Rx<LatLng?>(null);
  final mapController = MapController();
  var addressInfo = '...'.obs;
  Timer? _mainTimer;

  //Behavior Page
  @override
  void onInit() {
    super.onInit();
    _initLocTracking();
  }

  @override
  void onClose() {
    _mainTimer?.cancel();
    super.onClose();
  }

  //Main Logic
  void _initLocTracking() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    _mainTimer = Timer.periodic(
      Duration(seconds: 1),
      (t) async {
        try {
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          currentLocation.value = LatLng(
            position.latitude,
            position.longitude,
          );
        } catch (e) {
          Get.snackbar(
            'Error!',
            e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorConstant.errorColor,
            colorText: ColorConstant.onErrorColor,
            icon: Icon(
              Icons.error,
              color: ColorConstant.onErrorColor,
            ),
          );
        }
      },
    );
  }

  //Handle Action from User
  void handleBack() {
    Get.back();
  }

  void handleCenterMap() {
    if (currentLocation.value != null) {
      mapController.move(currentLocation.value!, 17);
    }
  }
}
