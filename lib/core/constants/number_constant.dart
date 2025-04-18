import 'package:intl/intl.dart';

class NumberConstant {
  static String numberFormat({
    required num angka,
  }) {
    final formatter = NumberFormat.decimalPattern('en_US');
    return formatter.format(angka);
  }
}
