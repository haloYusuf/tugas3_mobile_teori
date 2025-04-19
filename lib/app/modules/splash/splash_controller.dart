import 'dart:async';

import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/routes/route_name.dart';
import 'package:tugas3_mobile_teori/core/services/session_service.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;
  final session = Get.find<SessionService>();

  @override
  void onInit() {
    super.onInit();
    _showSplash();
  }

  void _showSplash() {
    Timer(const Duration(milliseconds: 500), () {
      opacity.value = 1.0;
    });

    Timer(const Duration(milliseconds: 2000), () {
      if (session.isLoggedIn()) {
        Get.offAllNamed(RouteName.main);
      } else {
        Get.offAllNamed(RouteName.login);
      }
    });
  }
}
