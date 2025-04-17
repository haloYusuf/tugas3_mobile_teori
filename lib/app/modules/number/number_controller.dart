import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberController extends GetxController {
  final TextEditingController numberController = TextEditingController();
  var result = ''.obs;
  var errorMessage = ''.obs;
  var isBulat = false.obs;
  var isPositif = false.obs;
  var isCacah = false.obs;
  var isNegatif = false.obs;
  var isPrima = false.obs;
  var isDesimal = false.obs;

  void handleBack() {
    Get.back();
  }

  void checkNumber() {
    String input = numberController.text.trim();

    if (input.isEmpty) {
      errorMessage.value = 'Silakan masukkan angka terlebih dahulu';
      result.value = '';
      return;
    }

    double? number = double.tryParse(input);
    if (number == null) {
      errorMessage.value = 'Input bukan angka yang valid';
      result.value = '';
      return;
    }

    errorMessage.value = '';

    isBulat.value = false;
    isPositif.value = false;
    isCacah.value = false;
    isNegatif.value = false;
    isPrima.value = false;
    isDesimal.value = false;

    if (number.toInt() == number) {
      // bilangan bulat
      isBulat.value = true;

      if (number == 0) {
        isCacah.value = true; // bilangan cacah ketika angka adalah 0
      } else if (number > 0) {
        isPositif.value = true;
      } else {
        isNegatif.value = true; // bilangan negatif
      }

      // bilangan tersebut prima
      int intNumber = number.toInt();
      if (intNumber > 1 && _isPrime(intNumber)) {
        isPrima.value = true;
      }
    } else {
      // bilangan desimal
      isDesimal.value = true;

      if (number < 0) {
        isNegatif.value = true;
      }
    }

    result.value = 'Angka $input termasuk:';
  }

  // bilangan prima
  bool _isPrime(int n) {
    for (int i = 2; i <= n / 2; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }
}
