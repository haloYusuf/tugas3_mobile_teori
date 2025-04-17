import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/routes/route_name.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';
import 'package:tugas3_mobile_teori/core/services/session_service.dart';

class HomeController extends GetxController {
  final _session = SessionService();
  final _listRoute = [
    RouteName.stopwatch,
    RouteName.number,
    RouteName.lbsTracking,
    RouteName.timeConvert,
    RouteName.siteRecommend,
  ];

  String getHeaderContent() {
    return 'Welcome, ${_session.getUsername()}';
  }

  Widget getContentButton({
    required int index,
    required String title,
  }) {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(
          _listRoute[index],
          preventDuplicates: false,
        );
      },
      child: Text(
        title,
      ),
    );
  }

  void handleLogOut() {
    Get.dialog(
      AlertDialog(
        title: Text('Konfirmasi Logout'),
        content: Text('Apakah Anda yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              _session.logout().then(
                (v) {
                  Get.offAllNamed(RouteName.login);
                },
                onError: (e) {
                  Get.snackbar(
                    'Error!',
                    'Something went wrong. Please try again.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: ColorConstant.errorColor,
                    colorText: ColorConstant.onErrorColor,
                    icon: Icon(
                      Icons.error,
                      color: ColorConstant.onErrorColor,
                    ),
                  );
                },
              );
            },
            child: Text('Yes'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
