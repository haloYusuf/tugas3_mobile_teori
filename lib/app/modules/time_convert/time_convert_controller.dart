import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';
import 'package:tugas3_mobile_teori/core/constants/number_constant.dart';

class TimeConvertController extends GetxController {
  TextEditingController inputController = TextEditingController();
  var isShowAnswer = false.obs;
  var resultAnswer = ''.obs;

  TextInputFormatter setDecimalInputFormater() {
    return TextInputFormatter.withFunction(
      (oldValue, newValue) {
        final text = newValue.text;

        final isValidChars = RegExp(r'^[0-9.]*$').hasMatch(text);
        if (!isValidChars ||
            text.startsWith('.') ||
            '.'.allMatches(text).length > 1) {
          return oldValue;
        }

        return newValue;
      },
    );
  }

  String _resultFormatTimeFromYears({required double years}) {
    const int secondsInMinute = 60;
    const int minutesInHour = 60;
    const int hoursInDay = 24;
    const int daysInYear = 365;

    int days = (daysInYear * years).round();

    int totalSeconds =
        (days * hoursInDay * minutesInHour * secondsInMinute).round();

    int hours = totalSeconds ~/ 3600;
    int minutes = hours * 60;

    return 'Konversi dari $years Tahun :\nke Hari : ${NumberConstant.numberFormat(
      angka: days,
    )}\nke Jam : ${NumberConstant.numberFormat(
      angka: int.parse(
        hours.toString().padLeft(2, '0'),
      ),
    )}\nke Menit : ${NumberConstant.numberFormat(
      angka: int.parse(
        minutes.toString().padLeft(2, '0'),
      ),
    )}\nke Detik : ${NumberConstant.numberFormat(
      angka: int.parse(
        totalSeconds.toString().padLeft(2, '0'),
      ),
    )}';
  }

  void _showErrorSnackbar({
    required String content,
  }) {
    Get.snackbar(
      'Error!',
      content,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConstant.errorColor,
      colorText: ColorConstant.onErrorColor,
      icon: Icon(
        Icons.error,
        color: ColorConstant.onErrorColor,
      ),
    );
  }

  void handleHitung() {
    var value = inputController.text;

    if (value.isEmpty) {
      isShowAnswer.value = false;
      _showErrorSnackbar(
        content: 'Harap masukkan angka terlebih dahulu.',
      );
    } else {
      try {
        var valueDouble = double.tryParse(value);
        if (valueDouble != null) {
          isShowAnswer.value = true;
          resultAnswer.value = _resultFormatTimeFromYears(years: valueDouble);
        } else {
          isShowAnswer.value = false;
          _showErrorSnackbar(
            content: 'Data harus > 0.',
          );
        }
      } catch (e) {
        isShowAnswer.value = false;
        _showErrorSnackbar(
          content: 'Gagal melakukan konversi data.',
        );
      }
    }
  }
}
