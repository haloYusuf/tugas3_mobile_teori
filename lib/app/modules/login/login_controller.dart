import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/routes/route_name.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';
import 'package:tugas3_mobile_teori/core/services/session_service.dart';

class LoginController extends GetxController {
  final userNameController = TextEditingController();
  final passController = TextEditingController();

  final _isVisible = false.obs;
  final _isUserNameError = false.obs;
  final _isPassError = false.obs;

  bool getVisibilityStatus() {
    return _isVisible.value;
  }

  bool getUserNameErrorStatus() {
    return _isUserNameError.value;
  }

  bool getPasswordStatus() {
    return _isPassError.value;
  }

  void handleVisibility() {
    _isVisible.value = !_isVisible.value;
  }

  Future handleLogin() async {
    var userName = userNameController.text;
    var pass = passController.text;

    _showDialog();

    await Future.delayed(Duration(seconds: 1));

    Get.back();

    if (userName.isEmpty) {
      _isUserNameError.value = true;
    } else if (pass != 'tugas3-mobile') {
      _isUserNameError.value = false;
      _isPassError.value = true;
    } else {
      _isUserNameError.value = false;
      _isPassError.value = false;

      var session = SessionService();
      session.login(username: userName).then(
        (v) {
          Get.offAllNamed(RouteName.main);
        },
        onError: (v) {
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
    }
  }

  void _showDialog() {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }
}
