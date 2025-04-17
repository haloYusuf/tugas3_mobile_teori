import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:tugas3_mobile_teori/app/models/address_model.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';
import 'package:tugas3_mobile_teori/core/services/address_service.dart';

class LbsTrackingController extends GetxController {
  final mapController = MapController();
  var currentLocation = Rx<LatLng?>(null);
  var addressInfo = '...'.obs;
  String _curLat = '';
  String _curLong = '';
  AddressService addressService = AddressService();
  Timer? _mainTimer;

  late AddressModel addressModel;

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
          if (_curLat.isEmpty && _curLong.isEmpty) {
            _setCurrentValue(
              lat: position.latitude.toString(),
              long: position.longitude.toString(),
            );
            addressModel = await addressService.getDetailAddress(
              latitude: _curLat,
              longitude: _curLong,
            );
          } else {
            if (_curLat != position.latitude.toString() ||
                _curLong != position.longitude.toString()) {
              _setCurrentValue(
                lat: position.latitude.toString(),
                long: position.longitude.toString(),
              );
              addressModel = await addressService.getDetailAddress(
                latitude: _curLat,
                longitude: _curLong,
              );
            }
          }

          addressInfo.value = _templateAddressInfo(
            desa: addressModel.desa,
            kabupaten: addressModel.kabupaten,
            provinsi: addressModel.provinsi,
            negara: addressModel.negara,
          );
        } catch (e) {
          _setCurrentEmpty();
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

  void _setCurrentValue({
    required String lat,
    required String long,
  }) {
    _curLat = lat;
    _curLong = long;
  }

  void _setCurrentEmpty() {
    _curLat = '';
    _curLong = '';
  }

  String _templateAddressInfo({
    required String desa,
    required String kabupaten,
    required String provinsi,
    required String negara,
  }) {
    return desa.isEmpty
        ? 'Searching...'
        : '$desa, $kabupaten, $provinsi, $negara';
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
