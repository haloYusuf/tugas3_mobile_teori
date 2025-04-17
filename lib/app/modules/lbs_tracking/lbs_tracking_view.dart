import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/lbs_tracking/lbs_tracking_controller.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';

class LbsTrackingView extends StatelessWidget {
  const LbsTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    LbsTrackingController controller = Get.put(LbsTrackingController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.handleBack,
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'LBS Tracker',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                Text(
                  'Lokasi Anda Sekarang :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 500,
                  child: Obx(
                    () {
                      final location = controller.currentLocation.value;
                      if (location == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Stack(
                        children: [
                          FlutterMap(
                            mapController: controller.mapController,
                            options: MapOptions(
                              initialCenter: location,
                              initialZoom: 17,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c'],
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: location,
                                    width: 25,
                                    height: 25,
                                    child: const Icon(
                                      Icons.pin_drop,
                                      color: ColorConstant.primaryColor,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            child: FloatingActionButton(
                              onPressed: controller.handleCenterMap,
                              child: const Icon(
                                Icons.my_location,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Obx(
                  () => Text(
                    controller.addressInfo.value,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
